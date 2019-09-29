<template>
    <div id="app" :style="userColours" >
        <div class="no-print" :class="[deck.appearance.isPNP ? 'printnplay' : '']">
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
            <div class="deck-properties no-print">
                <div>
                    <input type="checkbox" id="printnplay" v-model="deck.appearance.isPNP">
                    <label for="printnplay">Print and play</label>
                    Change colour scheme to use less ink when printing
                </div>
                <div v-if="deck.appearance.isPNP">
                    <label>Border colour</label>
                    <input v-model="deck.appearance.borderColour" type="color">
                </div>
                <div v-else>
                    <label>Highlight colour</label>
                    <input v-model="deck.appearance.highlightColour" type="color">
                </div>
                <div>
                    <label>Deck name</label>
                    <input v-model="deck.name" placeholder="">
                </div>
                <div>
                    <label>Number of sidekicks</label>
                    <input v-model.number="deck.sidekick.quantity" type="number" min="0">
                </div>
            </div>

            <UnmatchedCard v-for="card in fullDeck"
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
            <div class="no-print">
                <button @click="add">Add card</button>
            </div>
        </div>
        <div>

        </div>
        <div class="print">
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
            <UnmatchedCharacterCard
                :hero="deck.hero"
                :sidekick="deck.sidekick"
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
        }
        .card {
            float: left;
            margin: 0;
            page-break-inside: avoid;
        }
    }

    .card {
        float: left;
        margin: 50px;
    }

    .card, .card * {
        font-weight: normal;
        font-family: BebasNeueRegular, sans-serif;
        color-adjust: exact;
    }
</style>
