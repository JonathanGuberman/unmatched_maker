<template>
    <div id="app" :style="userColours" :class="[deck.appearance.isPNP ? 'printnplay' : '']">
        <div class="no-print container">
            <div class="row py-3 justify-content-center">
                <div class="col-10">
                    <h1>Unmatched Deck Creator</h1>
                    <p>
                        Unmatched is a board game from Restoration Games
                        and Mondo. Here's how they describe it:
                    </p>
                    <blockquote class="blockquote px-5">
                        <p class="mb-0">
                            Unmatched is a highly asymmetrical miniature fighting game
                            for two or four players. Each hero is represented by a
                            unique deck designed to evoke their style and legend.
                            Tactical movement and no-luck combat resolution create
                            a unique play experience that rewards expertise,
                            but just when you've mastered one set, new heroes
                            arrive to provide all new match-ups.
                        </p>
                    </blockquote>
                    <p>
                        Of course, the more heroes there are to choose from,
                        the more fun the game becomes. So, in the hopes of facilitating
                        a community of fan expansions, this tool allows anybody to
                        create a deck in the style of the real game.
                    </p>
                </div>
            </div>

            <div class="row py-3">
                <div class="col">
                    <h2>Editing</h2>
                    <p>
                        Move your mouse over the cards to see what you can edit.
                        Anything editable will be highlighted when you mouse over it.
                    </p>
                    <p>
                        Edit any text on a card by clicking on it and typing.
                        For numbers, click on the "increase" and "decease"
                        buttons that appear when you mouse over them.
                    </p>
                    <p>
                        You can create multiple copies of a card by changing the quantity
                        in the lower right corner. These cards remain linked;
                        modifications to any one will affect all of them!
                    </p>
                </div>
                <div class="col">
                    <h2>Printing</h2>
                    <p>
                        What you see is not quite what you get: when you print,
                        everything except the cards will be hidden, and the cards
                        will be next to each other to make cutting them out easier.
                    </p>
                    <p>
                        To ensure correct printing, be sure to <strong>set your
                        paper orientation to "Landscape"</strong>. You can save to a file
                        using the "Save to PDF" option in your print dialogue.

                    </p>
                    <p>
                        <em>Firefox users note</em>: you will need to select "Print Background Colors"
                        and "Print Background Images" for everything to appear correctly.
                        This is in the "Print" dialogue on Macs and in the "Page Settings"
                        dialogue on Windows.
                    </p>
                </div>
                <div class="col">
                    <h2>Saving and sharing</h2>
                    <p>
                        As you work your deck is automatically saved to your browser's local storage;
                        if you return in the same browser on the same computer, your deck should
                        still be there.
                    </p>
                    <p>
                        If you want to make more than one deck or share decks with friends,
                        scroll to the <a href="#deck-definition">Deck Definition</a> section.
                        There you can copy and paste the code that defines your deck.
                    </p>
                    <p>
                        (In the future I hope to have a more readable format for sharing, but
                        for now JSON will have to do.)
                    </p>
                </div>
            </div>

            <div class="row py-3">
                <div class="col-auto">
                    <h2>Character</h2>
                    <UnmatchedCharacterCard
                        :isEditable="true"
                        :heroName.sync="deck.hero.name"
                        :heroIsRanged.sync="deck.hero.isRanged"
                        :heroHp.sync="deck.hero.hp"
                        :heroMove.sync="deck.hero.move"
                        :heroSpecialAbility.sync="deck.hero.specialAbility"
                        :sidekickName.sync="deck.sidekick.name"
                        :sidekickIsRanged.sync="deck.sidekick.isRanged"
                        :sidekickHp.sync="deck.sidekick.hp"
                        :sidekickQuantity.sync="deck.sidekick.quantity"
                        :sidekickQuote.sync="deck.sidekick.quote"
                    />
                </div>
                <div class="col deck-properties">
                    <h2>Appearance</h2>
                    <div class="card-deck appearance">
                        <div class="card"
                            :class="[deck.appearance.isPNP ? 'text-muted' : 'border-primary']"
                            @click="deck.appearance.isPNP = false"
                        >
                            <h5 class="card-header">
                                Production
                            </h5>
                            <div class="card-body">
                                <p class="card-text">
                                    As close as possible to the real thing without having
                                    Oliver Barrett do the art for you.
                                </p>
                                <div class="form-group">
                                    <label>
                                        Highlight colour
                                    </label>
                                    <input
                                        v-model="deck.appearance.highlightColour"
                                        :disabled="deck.appearance.isPNP"
                                        class="form-control"
                                        type="color"
                                    >
                                </div>
                            </div>
                        </div>
                        <div class="card"
                            :class="[deck.appearance.isPNP ? 'border-primary': 'text-muted']"
                            @click="deck.appearance.isPNP = true"
                        >
                            <h5 class="card-header">
                                Print and play
                            </h5>
                            <div class="card-body">
                                <p class="card-text">
                                    Something a little simpler, but still great looking,
                                    for saving ink when printing DIY cards.
                                </p>
                                <p>
                                    <label>
                                        Border colour
                                    </label>
                                    <input
                                        v-model="deck.appearance.borderColour"
                                        :disabled="!deck.appearance.isPNP"
                                        class="form-control"
                                        type="color"
                                    >
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <h2>Deck</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-auto py-3" v-for="(card, index) in fullDeck" :key="card.id">
                    <ZoomBox>
                        <UnmatchedCard
                            :isEditable="true"
                            :deckProperties="deck"
                            :cardType.sync="card.data.type"
                            :cardValue.sync="card.data.value"
                            :cardTitle.sync="card.data.title"
                            :characterName.sync="card.data.characterName"
                            :boostValue.sync="card.data.boost"
                            :basicText.sync="card.data.basicText"
                            :immediateText.sync="card.data.immediateText"
                            :duringText.sync="card.data.duringText"
                            :afterText.sync="card.data.afterText"
                            :imageUrl.sync="card.data.imageUrl"
                            :cardQuantity.sync="card.data.quantity"
                            class="float-left shadow"
                            :class="{'border-danger': index >= 30}"
                            @delete:card="$delete(deck.cards, card.origIndex)"
                        />
                    </ZoomBox>
                </div>
                <div class="col-auto py-3" v-for="(_, index) in remainingCards">
                    <div v-if="index === 0" class="unmatched-card blank" @click="add" style="cursor: pointer;">
                        <i class="fas fa-plus-circle"></i>
                    </div>
                    <div v-else class="unmatched-card blank">
                        {{index + fullDeck.length + 1}}
                    </div>
                </div>
            </div>
            <div class="row py-5">
                <div class="col-12">
                    <h2 id="deck-definition">Deck definition</h2>
                    <p>
                        This is the code that defines your deck. You can copy and paste this
                        code to share or save your deck. You can also edit it live (which is
                        currently a bit buggy, so use at your own risk!)
                    </p>
                    <textarea
                        :value="userDeck"
                        @input="parseDeck($event.target.value)"
                        style="width: 100%;"
                        :class="{'border-danger user-input-invalid': !isValid}"
                    >
                    </textarea>
                </div>
            </div>
        </div>

        <div class="print">
            <UnmatchedCharacterCard
                :heroName="deck.hero.name"
                :heroIsRanged="deck.hero.isRanged"
                :heroHp="deck.hero.hp"
                :heroMove="deck.hero.move"
                :heroSpecialAbility="deck.hero.specialAbility"
                :sidekickName="deck.sidekick.name"
                :sidekickIsRanged="deck.sidekick.isRanged"
                :sidekickHp="deck.sidekick.hp"
                :sidekickQuantity="deck.sidekick.quantity"
                :sidekickQuote="deck.sidekick.quote"
            />
            <UnmatchedCard v-for="card in fullDeck"
                :deckProperties="deck"
                :cardType="card.data.type"
                :cardValue="card.data.value"
                :cardTitle="card.data.title"
                :characterName="card.data.characterName"
                :boostValue="card.data.boost"
                :basicText="card.data.basicText"
                :immediateText="card.data.immediateText"
                :duringText="card.data.duringText"
                :afterText="card.data.afterText"
                :imageUrl="card.data.imageUrl"
                :cardQuantity="card.data.quantity"
                :key="card.id"
                :isEditable="false"
                class="float-left"
            />
        </div>
    </div>
</template>

<script>
import UnmatchedCard from '@/components/UnmatchedCard.vue'
import UnmatchedCharacterCard from '@/components/UnmatchedCharacterCard.vue'
import ZoomBox from '@/components/ZoomBox.vue'

export default {
    name: 'app',
    components: {
        UnmatchedCard,
        UnmatchedCharacterCard,
        ZoomBox
    },
    data: function () {
        return {
            deck: {
                name: "",
                appearance: {
                    isPNP: false,
                    borderColour: "#E0EFF0",
                    highlightColour: "#F07838",
                },
                hero: {
                    name: "Hero",
                    isRanged: false,
                    hp: 15,
                    move: 2,
                    specialAbility: "This is the character's special ability."
                },
                sidekick: {
                    name: "Sidekick",
                    isRanged: true,
                    hp: 6,
                    quantity: 1,
                    quote: "I work best alone"
                },
                cards: [],
            },
            userDeck: '',
            isValid: true,
        }
    },
    computed: {
        fullDeck: function() {
            var fullDeck = [];
            this.deck.cards.forEach((card, outerIndex) => {
                var quantity = parseInt(card.quantity) || 1;
                quantity = quantity > 0 ? quantity : 1;
                [...Array(quantity)].forEach((_, innerIndex) => {
                    fullDeck.push({
                        data: card,
                        id: `${outerIndex}_${innerIndex}`,
                        origIndex: outerIndex,
                    });
                });
            });
            return fullDeck
        },
        remainingCards: function() {
            const remainingCardCount = this.fullDeck.length < 30 ? 30 - this.fullDeck.length : 0;
            return [...Array(remainingCardCount)]
        },
        userColours: function() {
            return {
                '--inner-border-colour': this.deck.appearance.isPNP ? this.deck.appearance.borderColour : "#F7EADB",
                '--outer-border-colour': '#F7EADB',
                '--highlight-colour': this.deck.appearance.highlightColour,
                '--contrast-colour': this.isDarkText(this.deck.appearance.highlightColour),
            }
        }
    },
    watch: {
        'deck': {
            handler: function() {
                this.userDeck = JSON.stringify(this.deck, null, 2);
                this.localStorageSave();
            },
            deep: true
        }
    },
    mounted: function() {
        this.$nextTick(() => {
            if (localStorage.getItem('unmatched-deck')) {
                const deck = JSON.parse(localStorage.getItem('unmatched-deck'));
                this.deck.name = deck.name
                this.deck.appearance = deck.appearance
                this.deck.hero = deck.hero
                this.deck.sidekick = deck.sidekick
                deck.cards.forEach((card, index) => {
                    this.$set(this.deck.cards, index, card);
                })
            }
        });
    },
    methods: {
        add: function() {
            this.deck.cards.push(
                {
                    title: "Card title",
                    type: "versatile",
                    characterName: "Any",
                    value: 2,
                    boost: 1,
                    basicText: "",
                    immediateText: "",
                    duringText: "",
                    afterText: "",
                    imageUrl: '',
                    quantity: 1,
                })
        },
        parseDeck: function(value) {
            this.userDeck = value;
            try {
                this.deck = JSON.parse(value);
                this.isValid = true;
            } catch {
                this.isValid = false;
            }
        },
        localStorageSave: function() {
            localStorage.setItem('unmatched-deck', JSON.stringify(this.deck));
        },
        hexToRgb: function(hex) {
          // Expand shorthand form (e.g. "03F") to full form (e.g. "0033FF")
          var shorthandRegex = /^#?([a-f\d])([a-f\d])([a-f\d])$/i;
          hex = hex.replace(shorthandRegex, function(m, r, g, b) {
            return r + r + g + g + b + b;
          });

          var result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
          return result ? {
            r: parseInt(result[1], 16),
            g: parseInt(result[2], 16),
            b: parseInt(result[3], 16)
          } : null;
        },
        isDarkText: function(hex) {
            const colour = this.hexToRgb(hex);
            const C = [colour.r/255, colour.g/255, colour.b/255].map(component => {
                if ( component <= 0.03928 ) {
                    return component/12.92
                } else {
                    return Math.pow((component+0.055)/1.055, 2.4);
                }
            });
            const L = 0.2126*C[0] + 0.7152*C[1] + 0.0722*C[2];
            return (L > 0.179) ? 'black' : 'white'
        }
    }
}
</script>

<style lang="less">
    @font-face {
        font-family: BebasNeueRegular;
        src: url("~@/assets/fonts/BebasNeueRegular-vm3oZ.otf");
        font-weight: normal;
        font-style: normal;
    }

    @font-face {
        font-family: League Gothic;
        src: url("~@/assets/fonts/LeagueGothic-Regular.otf");
        font-weight: normal;
        font-style: normal;
    }

    @font-face {
        font-family: Archivo Narrow;
        src: url("~@/assets/fonts/ArchivoNarrow-Regular.otf");
        font-weight: normal;
        font-style: normal;
    }

    @font-face {
        font-family: Archivo Narrow;
        src: url("~@/assets/fonts/ArchivoNarrow-Bold.otf");
        font-weight: bold;
        font-style: normal;
    }

    @font-face {
        font-family: Archivo Narrow;
        src: url("~@/assets/fonts/ArchivoNarrow-Italic.otf");
        font-weight: normal;
        font-style: italic;
    }

    @font-face {
        font-family: Archivo Narrow;
        src: url("~@/assets/fonts/ArchivoNarrow-BoldItalic.otf");
        font-weight: bold;
        font-style: italic;
    }

    * {
        box-sizing: border-box;
    }

    @page {
        size: landscape;
    }

    .printnplay {
        .unmatched-card {
            border-radius: 0;
            background: var(--inner-border-colour);
        }
    }

    .print {
        display: none;
    }

    @media print {
        * {
            -webkit-transition: none !important;
            transition: none !important;
        }

        .no-print {
            display: none !important;
        }

        .print {
            display: block !important;

            .unmatched-card {
                float: left;
                margin: 0;
                page-break-inside: avoid;
            }
        }
    }

    .unmatched-card {
        line-height: normal;
        // float: left;
        // margin: 50px;
    }

    .unmatched-card {
        width: 63mm;
        height: 88mm;
        background: var(--outer-border-colour);
        padding: 3mm;

        border-radius: 2.5mm;
        &.blank {
            background: #EEE;
            color: #CCC;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            text-align: center;

            font-size: 32mm;
        }
    }

    .unmatched-card, .unmatched-card * {
        font-weight: normal;
        font-family: BebasNeueRegular, sans-serif;
        color-adjust: exact;
    }

    .appearance .card {
        cursor: pointer;
    }

    .user-input-invalid {
        border-width: 3px;
    }

    .border-danger {
        border-width: 1mm;
    }
</style>
