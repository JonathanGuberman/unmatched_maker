<template>
    <div class="card-editor">
        <UnmatchedCard
            :deckProperties="deck"
            :cardType="card.type"
            :cardTitle="card.title"
            :characterName="characterName"
            :boostValue="card.boost"
            :cardValue="card.value"
            :basicText="card.basicText"
            :immediateText="card.immediateText"
            :duringText="card.duringText"
            :afterText="card.afterText"
            :imageUrl="card.imageUrl"
            :cardQuantity="card.quantity"
            class="float-left"
        />
        <div class="card-properties no-print">
            <div>
                <label>Card type</label>
                <select v-model="card.type">
                    <option>scheme</option>
                    <option>attack</option>
                    <option>defence</option>
                    <option>versatile</option>
                </select>
            </div>
            <div>
                <label>Card title</label>
                <input v-model="card.title" placeholder="">
            </div>
            <div v-if="card.type!=='scheme'">
                <label>Card value</label>
                <input v-model.number="card.value" placeholder="" type="number" min="0">
            </div>
            <div>
                <label>Playable by</label>
                <input type="radio" v-model="card.wieldedBy" value="hero">
                <label>
                    {{deck.hero.name || 'Hero'}}
                </label>
                <br>
                <input type="radio" v-model="card.wieldedBy" value="any">
                <label>
                    Any
                </label>
                <br>
                <input type="radio" v-model="card.wieldedBy" value="sidekick">
                    <label>{{deck.sidekick.name || 'Sidekick'}}
                </label>
            </div>
            <div>
                <label>Boost value</label>
                <input v-model.number="card.boost" type="number" min="0">
            </div>
            <div v-if="card.type==='scheme'">
                <label>Effect text</label>
                <textarea v-if="card.type==='scheme'" v-model="card.basicText" placeholder=""></textarea>
            </div>
            <div v-if="card.type!=='scheme'">
                <label>"Immediately" text</label>
                <textarea v-if="card.type!=='scheme'" v-model="card.immediateText" placeholder=""></textarea>
            </div>
            <div v-if="card.type!=='scheme'">
                <label>"During combat" text</label>
                <textarea v-if="card.type!=='scheme'" v-model="card.duringText" placeholder=""></textarea>
            </div>
            <div v-if="card.type!=='scheme'">
                <label>"After combat" text</label>
                <textarea v-model="card.afterText" placeholder=""></textarea>
            </div>
            <div>
                <label>Number of copies in deck</label>
                <input v-model.number="card.quantity" type="number" min="1">
            </div>
            <div>
                <label>Image URL</label>
                <input v-model="card.imageUrl" placeholder="Image Url">
                Images should be around square to properly fit
            </div>
        </div>
    </div>
</template>

<script>
import UnmatchedCard from '@/components/UnmatchedCard.vue'

export default {
    name: 'CardEditor',
    components: {
        UnmatchedCard
    },
    props: {
        value: {
            type: Object,
            required: true
        },
        deck: {
            type: Object
        }
    },
    computed: {
        card: {
                get() { return this.value },
                set(card) {this.$emit('input', card)}
        },
        characterName: function () {
            switch (this.value.wieldedBy) {
                case 'hero':
                    return this.deck.hero.name || "Hero"
                case 'sidekick':
                    return this.deck.sidekick.name || "Sidekick"
                default:
                    return "Any"
            }
        }
    }
}
</script>

<style scoped lang="less">
.card-editor {
    overflow: hidden;
    float:left;
}

.float-left {
    float:left;
}
</style>
