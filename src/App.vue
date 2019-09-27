<template>
    <div id="app" :style="userColours" >
        <div class="no-print" :class="[deck.appearance.isPNP ? 'printnplay' : '']">
            <UnmatchedCharacterCard
                :hero="deck.hero"
                :sidekick="deck.sidekick"
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
                <div v-if="!deck.appearance.isPNP">
                    <label>Highlight colour</label>
                    <input v-model="deck.appearance.highlightColour" type="color">
                </div>
                <div>
                    <label>Deck name</label>
                    <input v-model="deck.name" placeholder="">
                </div>
                <div>
                    <label>Hero name</label>
                    <input v-model="deck.hero.name" placeholder="">
                </div>
                <div>
                    <label>Hero attack type</label>
                    <input type="radio" v-model="deck.hero.isRanged" :value="false">
                    <label>
                        Melee
                    </label>
                    <br>
                    <input type="radio" v-model="deck.hero.isRanged" :value="true">
                    <label>
                        Ranged
                    </label>
                </div>
                <div>
                    <label>Hero HP</label>
                    <input v-model.number="deck.hero.hp" type="number" min="1">
                </div>
                <div>
                    <label>Special Ability</label>
                    <textarea v-model="deck.hero.specialAbility"></textarea>
                </div>
                <div>
                    <label>Movement</label>
                    <input v-model.number="deck.hero.move" type="number" min="1">
                </div>
                <div>
                    <label>Sidekick name</label>
                    <input v-model="deck.sidekick.name" placeholder="">
                </div>
                <div>
                    <label>Sidekick attack type</label>
                    <input type="radio" v-model="deck.sidekick.isRanged" :value="false">
                    <label>
                        Melee
                    </label>
                    <br>
                    <input type="radio" v-model="deck.sidekick.isRanged" :value="true">
                    <label>
                        Ranged
                    </label>
                </div>
                <div>
                    <label>Sidekick HP</label>
                    <input v-model.number="deck.sidekick.hp" type="number" min="1">
                </div>
                <div>
                    <label>Number of sidekicks</label>
                    <input v-model.number="deck.sidekick.quantity" type="number" min="0">
                </div>
            </div>
            <CardEditor v-for="card in fullDeck" v-model="card.data" :deck="deck" :key="card.id"/>
            <div class="no-print">
                <button @click="add">Add card</button>
            </div>
        </div>
        <div>

        </div>
        <div class="print">
            <CardEditor v-for="card in fullDeck" v-model="card.data" :deck="deck" :key="card.id"/>
            <UnmatchedCharacterCard
                :hero="deck.hero"
                :sidekick="deck.sidekick"
            />
        </div>
    </div>
</template>

<script>
import CardEditor from '@/components/CardEditor.vue'
import UnmatchedCharacterCard from '@/components/UnmatchedCharacterCard.vue'

export default {
    name: 'app',
    components: {
        CardEditor,
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
            page-break-inside: avoid;
        }
    }

    .card, .card * {
        font-weight: normal;
        font-family: BebasNeueRegular, sans-serif;
        color-adjust: exact;
    }
</style>
