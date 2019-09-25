<template>
    <div id="app">
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
                <label>Sidekick name</label>
                <input v-model="deck.sidekickName" placeholder="">
            </div>
        </div>
        <CardEditor v-for="card in deck.cards" v-model="card.data" :deck="deck"/>
        <div class="no-print">
            <button @click="add">Add card</button>
        </div>
    </div>
</template>

<script>
import CardEditor from '@/components/CardEditor.vue'

export default {
    name: 'app',
    components: {
        CardEditor
    },
    data: function () {
        return {
            deck: {
                name: "",
                isPNP: true,
                borderColour: "#E0EFF0",
                heroName: "",
                sidekickName: "",
                cards: []
            },
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
                    quantity: 1
                },
            })
        }
    }
}
</script>

<style lang="less">
    * {
        box-sizing: border-box;
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
