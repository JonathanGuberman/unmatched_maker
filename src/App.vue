<template>
    <div id="app">
        <UnmatchedCharacterCard
            :deckProperties="deck"
        />
        <div class="deck-properties no-print">
            <div>
                <input type="checkbox" id="printnplay" v-model="deck.isPNP">
                <label for="printnplay">Print and play</label>
                Change colour scheme to use less ink when printing
            </div>
            <div v-if="deck.isPNP">
                <label>Border colour</label>
                <input v-model="deck.borderColour" type="color">
            </div>
            <div>
                <label>Deck name</label>
                <input v-model="deck.name" placeholder="">
            </div>
            <div>
                <label>Hero name</label>
                <input v-model="deck.heroName" placeholder="">
            </div>
            <div>
                <label>Hero attack type</label>
                <input type="radio" v-model="deck.heroIsRanged" :value="false">
                <label>
                    Melee
                </label>
                <br>
                <input type="radio" v-model="deck.heroIsRanged" :value="true">
                <label>
                    Ranged
                </label>
            </div>
            <div>
                <label>Hero HP</label>
                <input v-model.number="deck.heroHP" type="number" min="1">
            </div>
            <div>
                <label>Special Ability</label>
                <textarea v-model="deck.specialAbility"></textarea>
            </div>
            <div>
                <label>Movement</label>
                <input v-model.number="deck.moveValue" type="number" min="1">
            </div>
            <div>
                <label>Sidekick name</label>
                <input v-model="deck.sidekickName" placeholder="">
            </div>
            <div>
                <label>Sidekick attack type</label>
                <input type="radio" v-model="deck.sidekickIsRanged" :value="false">
                <label>
                    Melee
                </label>
                <br>
                <input type="radio" v-model="deck.sidekickIsRanged" :value="true">
                <label>
                    Ranged
                </label>
            </div>
            <div>
                <label>Sidekick HP</label>
                <input v-model.number="deck.sidekickHP" type="number" min="1">
            </div>
        </div>
        <CardEditor v-for="card in fullDeck" v-model="card.data" :deck="deck"/>
        <div class="no-print">
            <button @click="add">Add card</button>
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
                isPNP: true,
                borderColour: "#E0EFF0",
                heroName: "",
                heroIsRanged: false,
                sidekickName: "",
                sidekickIsRanged: false,
                cards: [],
            },
        }
    },
    computed: {
        fullDeck: function() {
            var fullDeck = [];
            this.deck.cards.forEach(card => {
                var quantity = parseInt(card.data.quantity) || 1;
                quantity = quantity > 0 ? quantity : 1;
                [...Array(quantity)].forEach(() => {
                    fullDeck.push(card);
                });
            });
            return fullDeck
        }
    },
    methods: {
        add: function() {
            this.deck.cards.push({
                data: {
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
                },
            })
        }
    }
}
</script>

<style lang="less">
    * {
        box-sizing: border-box;
        font-weight: normal;
    }

    @media print {
        * {
            -webkit-transition: none !important;
            transition: none !important;
        }

        .no-print {
            display: none !important;
        }
    }

    // @page {
    //   size: 63mm 88mm;
    // }
</style>
