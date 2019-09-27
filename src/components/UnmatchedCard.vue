<template>
    <div class="card outer" :class="[cardType]">
        <div class="main-wrapper">
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
                <h2 v-if="cardType !== 'scheme'" class="value">
                    {{cardValue}}
                </h2>
            </div>
            <div class="upper-left character">
                <h2 class="character-name">
                    {{characterName}}
                </h2>
            </div>
            <div class="inner-top" :style="backgroundImage">
            </div>
            <div class="inner-bottom">
                <div v-if="boostValue" class="boost-circle inner-border">
                    <div class="boost-value">
                        <h3>{{boostValue}}</h3>
                    </div>
                </div>
                <h3>{{cardTitle}}</h3>
                <hr />
                <div class="card-text">
                    <div v-if="cardType === 'scheme'">
                        {{basicText}}
                    </div>
                    <div v-if="immediateText && cardType !== 'scheme'">
                        <strong>Immediately:</strong>{{immediateText}}
                    </div>
                    <div v-if="duringText && cardType !== 'scheme'">
                        <strong>During combat:</strong>{{duringText}}
                    </div>
                    <div v-if="afterText && cardType !== 'scheme'">
                        <strong>After combat:</strong>{{afterText}}
                    </div>
                </div>
                <div class="bottom-right">
                    <span class="deck-name">{{deckProperties.name}}</span><span class="card-quantity">x{{cardQuantity}}</span>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: 'UnmatchedCard',
    props: {
        deckProperties: {
            type: Object,
        },
        cardType: {
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

.upper-left {
    position: absolute;
    width: 10.8mm;
    height: 47mm;

    &.icon {
        width: @upper-left-width;
        height: 17.1mm;
        text-align: center;

        .value {
            margin: 0;
            padding-top: 7.5mm;
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
        background-position: center;
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
    .outer {
        border-radius: 0;
        background: var(--inner-border-colour);
    }

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

.outer {
    width: 63mm;
    height: 88mm;
    background: var(--outer-border-colour);
    padding: 3mm;

    border-radius: 2.5mm;
}

.main-wrapper {
    position: relative;
    overflow: hidden;
    border-radius: @corner;
}

.inner-top {
    height: 52.5mm;
    background: #FFF;
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
        h3 {
            margin: 0;
        }
        position: relative;
    }
}

.inner-bottom {
    position: relative;
    height: 28.8mm;

    // overflow: hidden;
    border-top: @border-width solid var(--inner-border-colour);

    padding: 2mm 3mm 1mm;
    background: #000;
    color: #FFF;
    h3 {
        margin: 0;
    }

    hr {
        border-style: 0.3mm solid;
        margin: 0mm 0 1mm;
    }

    .card-text, .card-text div {
        font-size: 3.3mm;
        line-height: 1.2em;
        font-family: Archivo Narrow, sans-serif;

        strong {
            font-size: 4mm;
            margin-right: 1mm;
        }
    }

    .bottom-right {
        padding: inherit;
        font-size: 1.8mm;
        position:absolute;
        bottom: 0;
        right:-1mm;

        .card-quantity {
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
