<template>
    <div class="unmatched-card" :class="[cardType, isEditable ? 'editable':'']">
        <div class="main-wrapper">
            <div class="inner-top" :style="backgroundImage">
                <input
                    v-if="isEditable"
                    type="text"
                    placeholder="Image URL"
                    :value="imageUrl"
                    @input="$emit('update:imageUrl', $event.target.value)"
                />
            </div>
            <div class="upper-left">
                <svg width="100%" height="100%" viewBox="0 0 10.8 47">
                    <polygon
                        class="border"
                        points="0,0 10.8,0 10.8,43.7 5,47 0,44.2"
                    />
                    <polygon
                        class="name-panel"
                        points="0,14.2 10,14.2 10,43.3 5,46.2 0,43.3"
                    />
                    <polygon
                        class="canton"
                        points="0,0 10,0 10,14.2 5,17.1 0,14.2"
                    />
                </svg>
            </div>
            <div class="upper-left icon">
                <div v-if="isEditable" class="editor" @click="updateCardType">
                </div>
                <div v-if="cardType !== 'scheme'" class="value">
                    {{cardValue}}
                    <EditorUpDownButtons
                        v-if="isEditable"
                        class="editor"
                        :value="cardValue"
                        @input="$emit('update:cardValue', $event)"
                        :minValue="0"
                    />
                </div>
            </div>
            <div class="upper-left character">
                <div class="character-name"
                    v-text="characterName"
                    :contenteditable="isEditable"
                    @blur="updateEditableText('characterName', $event)"
                    @keypress.13="$event.preventDefault(); $event.target.blur()"
                    style="min-width: 100%; min-height: 6mm;"
                >
                </div>
            </div>
            <div class="inner-bottom">
                <div class="boost-circle inner-border" :class="{'um-invisible': boostValue === 0}">
                    <div class="boost-value">
                        {{boostValue}}
                        <EditorUpDownButtons
                            v-if="isEditable"
                            class="editor"
                            :minValue="0"
                            :value="boostValue"
                            @input="$emit('update:boostValue', $event)"
                        />
                    </div>
                </div>
                <div
                    class="card-title"
                    v-text="cardTitle"
                    :contenteditable="isEditable"
                    @blur="updateEditableText('cardTitle', $event)"
                    @keypress.13="$event.preventDefault(); $event.target.blur()"
                    style="min-height: 1.17em;"
                >

                </div>
                <div class="card-text">
                    <div v-if="cardType === 'scheme'"
                        v-text="basicText"
                        :contenteditable="isEditable"
                        @blur="updateEditableText('basicText', $event)"
                        style="min-height: 100%; white-space: pre-wrap;"
                    >
                    </div>
                    <div v-else>
                        <div :class="{'empty': !immediateText}" @click="focusEditableText">
                            <strong>Immediately:</strong>
                            <span
                                v-text="immediateText"
                                :contenteditable="isEditable"
                                style="white-space: pre-wrap;"
                                @blur="updateEditableText('immediateText', $event)"
                            ></span>
                        </div>
                        <div :class="{'empty': !duringText}" @click="focusEditableText">
                            <strong>During combat:</strong>
                            <span
                                v-text="duringText"
                                :contenteditable="isEditable"
                                style="white-space: pre-wrap;"
                                @blur="updateEditableText('duringText', $event)"
                            ></span>
                        </div>
                        <div :class="{'empty': !afterText}" @click="focusEditableText">
                            <strong>After combat:</strong>
                            <span
                                v-text="afterText"
                                :contenteditable="isEditable"
                                style="white-space: pre-wrap;"
                                @blur="updateEditableText('afterText', $event)"
                            ></span>
                        </div>
                    </div>
                </div>
                <div class="bottom-right">
                    <span class="deck-name">{{deckProperties.name || deckProperties.hero.name}}</span>
                    <span class="card-quantity">
                        x{{cardQuantity}}
                        <EditorUpDownButtons
                            v-if="isEditable"
                            class="editor"
                            :value="cardQuantity"
                            @input="$emit('update:cardQuantity', $event)"
                            :minValue="1"
                        />
                    </span>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import EditorUpDownButtons from '@/components/EditorUpDownButtons.vue'
import editable from '@/mixins/editable.js'

export default {
    name: 'UnmatchedCard',
    components: {
        EditorUpDownButtons
    },
    mixins: [editable],
    props: {
        deckProperties: {
            type: Object,
        },
        cardType: {
            type: String,
            default: "versatile"
        },
        cardValue: {
            type: Number,
            default: 2
        },
        characterName: {
            default: "Any"
        },
        boostValue: {
            type: Number,
            default: 1
        },
        cardTitle: {
            default: "Card title"
        },
        basicText: {
            default: ""
        },
        immediateText: {
            default: ""
        },
        duringText: {
            default: ""
        },
        afterText: {
            default: ""
        },
        cardQuantity: {
            type: Number,
            default: 1
        },
        imageUrl: {
            default: ''
        },
        isEditable: {
            type: Boolean,
            default: false
        }
    },
    computed: {
        backgroundImage: function () {
            if (this.imageUrl) {
                return {
                    'background-image': `url(${this.imageUrl})`,
                    'background-repeat': 'no-repeat',
                    'background-size': '100%',
                }
            }
            return {}
        }
    },
    methods: {
        updateCardType: function () {
            var newType = 'versatile';
            if (this.cardType === 'versatile') {
                newType = 'attack';
            } else if (this.cardType === 'attack') {
                newType = 'defence';
            } else if (this.cardType === 'defence') {
                newType = 'scheme';
            }

            this.$emit('update:cardType', newType);
        },
        focusEditableText: function(event) {
            event.currentTarget.lastChild.focus();
        },
    }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="less">

@defence-blue: #2C76AC;
@attack-red: #DC3034;
@versatile-violet: #6C4E8D;
@scheme-yellow: #FCBD71;
@background-beige: #F7EADB;

@corner: 1.5mm;
@border-width: 0.8mm;
@upper-left-width: 10mm;
@upper-left-outer-width: @upper-left-width + @border-width;

@media print {
  * {
    -webkit-transition: none !important;
    transition: none !important;
    zoom: 1 !important;
  }
}

.editable {
    &:hover {
        // .editor {
        //     visibility: visible;
        //     opacity: 0.5;
        // }

        .um-invisible {
            opacity: 1;
        }
    }

    .inner-top {
        input {
            position: absolute;
            bottom: 0;
            width: 100%;
            font-family: initial;
            visibility: hidden;
        }

        &:hover input {
            visibility: visible;
        }
    }

    .icon {
        cursor: pointer;
    }

    /deep/ .editor {
        position: absolute;
        width: 100%;
        height: 100%;
        top: 0;
        left: 0;
    }

    /deep/ .invalid {
        visibility: hidden;
    }

    /deep/ .value {
        position: relative;
        .editor {
            left: 6mm;
            top: -4.5mm;
            width: 10mm;
            height: 18mm;
            visibility: hidden;
        }

        &:hover .editor {
            visibility: visible;
        }
    }

    /deep/ .boost-value {
        position: relative;
        .editor {
            left: 2.8mm;
            top: -5.8mm;
            width: 10mm;
            height: 18mm;
            visibility: hidden;
            opacity: 1;
        }

        &:hover .editor {
            visibility: visible;
        }
    }

    /deep/ .card-quantity {
        .editor {
            width: 10mm;
            height: 18mm;
            visibility: hidden;
            opacity: 1;
            top: -7mm;
            left: 0mm;
        }

        // &:hover {
        //     transform: scale(2);
        // }

        &:hover .editor {
            visibility: visible;
        }
    }

    .um-invisible:hover {
        opacity: 1;
    }

    .card-text:hover, .card-text:focus-within {
        .empty {
            display: block;
        }
    }
}

.um-invisible {
    opacity: 0;
}

.upper-left {
    position: absolute;
    width: 10.8mm;
    height: 47mm;
    border-top-left-radius: @corner;
    overflow: hidden;

    &.icon {
        width: @upper-left-width;
        // border-top-left-radius: @corner;

        height: 17.1mm;
        text-align: center;
        overflow: visible;

        .value {
            margin: 7.5mm 0 0;
            color: #FFF;
            font-size:7.8mm;
        }
    }

    &.character {
        top: 17.1mm;
        width: @upper-left-width;
        height: 29.1mm;

        .character-name {
            white-space: nowrap;
            color: #FFF;
            padding: 0;
            margin: 0;
            transform: rotate(-90deg);
            position: absolute;
            transform-origin: right bottom;
            text-align: right;
            text-transform: uppercase;

            font-size:6mm;

            bottom: 26.5mm;
            right: 1.1mm;
        }
    }

    .border {
        fill: var(--outer-border-colour);
    }

    .name-panel {
        fill: #000;
    }
}

.versatile {
    .canton {
        fill: @versatile-violet;
    }
    .icon{
        position: absolute;
        background-image: url("~@/assets/images/versatile.png");
        background-repeat: no-repeat;
        background-size: 6mm;
        background-position: 1.7mm 1.4mm;
    }
}

.attack {
    .canton {
        fill: @attack-red;
    }
    .icon{
        background-image: url("~@/assets/images/attack.png");
        background-repeat: no-repeat;
        background-size: 6.6mm;
        background-position: 1.7mm 1.4mm;
    }
}
.scheme {
    .canton {
        fill: @scheme-yellow;
    }
    .icon{
        background-image: url("~@/assets/images/scheme.png");
        background-repeat: no-repeat;
        background-size: 3.9mm;
        background-position: center 2mm;
    }
}
.defence {
    .canton {
        fill: @defence-blue;
    }
    .icon{
        background-image: url("~@/assets/images/defence.png");
        background-repeat: no-repeat;
        background-size: 5.3mm;
        // background-position: 2.5mm 1.4mm;
        background-position-x: center;
        background-position-y: 1.4mm;
    }
}

.printnplay {
    .upper-left {
        .border {
            fill: var(--inner-border-colour);
        }

        .name-panel {
            fill: #FFF;
        }

        .character-name {
            color: #000;
        }
    }

    // .inner-top {
    //     background: #FFF;
    // }

    .boost-circle {
        background: #FFF;
        .boost-value {
            color: #000;
        }
    }

    .inner-bottom {
        background: #FFF;
        color: #000;

        .bottom-right {
            .card-quantity {
                border-left-color: #000;
            }
        }
    }
}

.inner-border {
    background: var(--inner-border-colour);
    border-color: var(--inner-border-colour);
}

.main-wrapper {
    position: relative;
    // overflow: hidden;
    display: flex;
    flex-direction: column;
    height: 100%;
    border-radius: @corner;
}

.inner-top {
    // height: 52.5mm;
    position: relative;
    flex: 1;
    background: #FFF;
    border-top-left-radius: @corner;
    border-top-right-radius: @corner;
}

.boost-circle {
    position: absolute;
    z-index: 1;
    top: -4.5mm;
    left: 48mm;
    background: #000;
    border-width: @border-width;
    border-style: solid;

    width: 7.5mm;
    height: 7.5mm;
    border-radius: 100%;
    text-align: center;

    .boost-value {
        color: #FFF;
        padding-top: 0.1mm;
        position: relative;

        display: block;
        font-size: 1.17em;
        margin-block-start: 1em;
        margin-block-end: 1em;
        margin-inline-start: 0px;
        margin-inline-end: 0px;
        margin: 0;
    }
}

.inner-bottom {
    display: flex;
    flex-direction: column;
    position: relative;
    height: 28.8mm;

    // overflow: hidden;
    border-top: @border-width solid var(--inner-border-colour);
    border-bottom-left-radius: @corner;
    border-bottom-right-radius: @corner;


    padding: 2mm 3mm 1mm;
    background: #000;
    color: #FFF;
    .card-title {
        display: block;
        font-size: 1.17em;
        margin-block-start: 1em;
        margin-block-end: 1em;
        margin-inline-start: 0px;
        margin-inline-end: 0px;
        margin: 0 0 1.8mm;
        border-bottom: 0.3mm solid;
    }

    .card-text {
        flex: 1;
        overflow: scroll;

        .empty {
            display: none;
        }
        div, span {
            font-size: 3.3mm;
            line-height: 1.2em;
            font-family: Archivo Narrow, sans-serif;

            strong {
                font-size: 4mm;
                margin-right: 1mm;
            }
        }
    }

    .bottom-right {
        padding: inherit;
        font-size: 1.8mm;
        position:absolute;
        bottom: 0;
        right:-1mm;

        .card-quantity {
            position: relative;
            font-family: League Gothic, sans-serif;
            border-left: 0.2mm solid #FFF;
            padding-left: 0.5mm;
            padding-top: 0.7mm;
            margin-left: 0.5mm;
        }
    }
}

.upper-left-corner-wrapper {
    overflow: hidden;
}

.upper-left-outer {
    position: relative;
    top: 0;
    left: 0;
    height: 42.9mm + @border-width;
    width: @upper-left-width + @border-width;
    // border-top-left-radius: @corner;
}
</style>
