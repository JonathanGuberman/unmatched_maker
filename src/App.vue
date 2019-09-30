<template>
    <div id="app" :style="userColours" :class="[deck.appearance.isPNP ? 'printnplay' : '']">
        <div class="no-print container">
            <div class="row py-3">
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
                <div class="col-auto">
                    <h2>Getting started</h2>
                    <p>
                        Edit any text on the card by clicking on it and typing.
                        For numbers, when you mouse over them buttons will appear
                        allowing you to adjust them.
                    </p>
                    <p>
                        If you want more than one of the same card,
                        change the number in the lower right corner and it
                        will be duplicated automatically. Any changes you make
                        to any of the copies will get changed on all of the copies
                        of that card.
                    </p>

                </div>
            </div>
            <div class="row py-3">
                <div class="col-auto">
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
                                <p>
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
                                </p>
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
                <div class="col-auto py-3" v-for="card in fullDeck">
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
                        :key="card.id"
                        class="float-left"
                    />
                </div>
                <div class="col">
                    <button @click="add">Add card</button>
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
                characterName="Any"
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

export default {
    name: 'app',
    components: {
        UnmatchedCard,
        UnmatchedCharacterCard
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
        }
    },
    computed: {
        fullDeck: function() {
            var fullDeck = [];
            this.deck.cards.forEach(card => {
                var quantity = parseInt(card.quantity) || 1;
                quantity = quantity > 0 ? quantity : 1;
                [...Array(quantity)].forEach((_, index) => {
                    fullDeck.push({
                        data: card,
                        id: index
                    });
                });
            });
            return fullDeck
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
                    wieldedBy: 'any',
                })
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
    }

    .unmatched-card, .unmatched-card * {
        font-weight: normal;
        font-family: BebasNeueRegular, sans-serif;
        color-adjust: exact;
    }

    .appearance .card {
        cursor: pointer;
    }
</style>
