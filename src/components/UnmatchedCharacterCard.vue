<template>
    <div class="card" :class="[deckProperties.isPNP ? 'printnplay': '']" :style="userColours">
        <div class="main-wrapper">
            <div class="hero panel">
                <div class="name section">
                    <div class="gutter">
                        <h1>Hero</h1>
                    </div>
                    <div class="content xl">
                        {{deckProperties.heroName}}
                    </div>
                </div>
                <div class="attack-health section">
                    <div class="attack section">
                        <div class="gutter">
                            <h1>Attack</h1>
                        </div>
                        <div>
                            <img v-if="deckProperties.heroIsRanged" class="ranged icon" src="~@/assets/images/ranged.svg">
                            <img v-else="deckProperties.heroIsRanged" class="melee icon" src="~@/assets/images/melee.svg">
                        </div>
                    </div>
                    <div class="health section">
                        <div class="gutter">
                            <h1>Start health</h1>
                        </div>
                        <div>
                            <svg width="12.1mm" height="6.7mm" viewBox="0 0 12.1 6.7">
                                <path
                                    d="
                                        M 3.45 0.8
                                        a 11.5 11.5 0 0 1 5.2 0
                                        l 0 3.2
                                        l -2.6 2
                                        l -2.6 -2
                                        l 0 -3.2"
                                    stroke="none"
                                    fill="#C0C0C0"
                                />
                                <path
                                    d="
                                        M 6.05 5.1
                                        l 0.7 -0.6
                                        l -1.4 0
                                        "
                                    stroke="none"
                                    fill="#999"
                                />
                                <path
                                    class="arc"
                                    d="
                                        M 0 2.2
                                        a 11.5 11.5 0 0 1 12.1 0"
                                    stroke="#999"
                                    stroke-width="0.2"
                                    fill="none"
                                />
                            </svg>
                            <h2 class="hp">
                                {{deckProperties.heroHP}}
                            </h2>
                        </div>
                    </div>
                </div>
            </div>

            <div class="abilities panel">
                <div class="special section">
                    <div class="gutter">
                        <h1>Special abilities</h1>
                    </div>
                    <div class="content mixed-case">
                        {{deckProperties.specialAbility}}
                    </div>
                </div>
                <div class="move section">
                    <div class="arrow">
                        <img src="~@/assets/images/arrow.svg">
                    </div>
                    <div class="value">
                        {{deckProperties.moveValue}}
                    </div>
                    <div class="title">
                        <img src="~@/assets/images/move.svg">
                    </div>
                </div>
            </div>

            <div class="sidekick panel">
                <div v-if="deckProperties.sidekickName" class="name section">
                    <div class="gutter">
                        <h1>Sidekick</h1>
                    </div>
                    <div class="content xl">
                        {{deckProperties.sidekickName}}
                    </div>
                </div>
                <div class="attack-health section">
                    <div v-if="deckProperties.sidekickName" class="attack section">
                        <div class="gutter">
                            <h1>Attack</h1>
                        </div>
                        <div v-if="deckProperties.sidekickName">
                            <img v-if="deckProperties.sidekickIsRanged" class="ranged icon" src="~@/assets/images/ranged.svg">
                            <img v-else="deckProperties.sidekickIsRanged" class="melee icon" src="~@/assets/images/melee.svg">
                        </div>
                    </div>
                    <div v-if="deckProperties.sidekickName" class="health section">
                        <div class="gutter">
                            <h1>Start health</h1>
                        </div>
                        <div v-if="deckProperties.sidekickName">
                            <svg width="12.1mm" height="6.7mm" viewBox="0 0 12.1 6.7">
                                <path
                                    d="
                                        M 3.45 0.8
                                        a 11.5 11.5 0 0 1 5.2 0
                                        l 0 3.2
                                        l -2.6 2
                                        l -2.6 -2
                                        l 0 -3.2"
                                    stroke="none"
                                    fill="#C0C0C0"
                                />
                                <path
                                    d="
                                        M 6.05 5.1
                                        l 0.7 -0.6
                                        l -1.4 0
                                        "
                                    stroke="none"
                                    fill="#999"
                                />
                                <path
                                    class="arc"
                                    d="
                                        M 0 2.2
                                        a 11.5 11.5 0 0 1 12.1 0"
                                    stroke="#999"
                                    stroke-width="0.2"
                                    fill="none"
                                />
                            </svg>
                            <h2 class="hp">
                                {{deckProperties.sidekickHP}}
                            </h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import Vue from 'vue';

export default {
    name: 'UnmatchedCharacterCard',
    props: {
        deckProperties: {
            type: Object,
        },
    },
    data: function () {
        return {
            initialWidth: undefined,
            meleeSvg: require('@/assets/images/ranged.svg'),
            rangedSvg: require('@/assets/images/melee.svg'),
        }
    },
    computed: {
        userColours: function() {
            return {
                'zoom': 1,
                // '-moz-transform-origin': 'left top',
                // '-moz-transform': 'scale(2)',
                '--inner-border-colour': this.deckProperties.isPNP ? this.deckProperties.borderColour : "#F7EADB",
                '--outer-border-colour': '#F7EADB',
            }
        },
    },
    mounted: function() {
        const heroNameText = this.$el.querySelector('.hero .name .xl.content');
        const computedStyle = window.getComputedStyle(heroNameText);
        const paddingLeft = parseFloat(computedStyle.paddingLeft.replace('px',''));
        const paddingRight = parseFloat(computedStyle.paddingRight.replace('px',''));
        const width = parseFloat(computedStyle.width.replace('px',''));

        // TODO Probably can use something better than scrollWidth; look into that
        this.initialWidth = width - paddingLeft - paddingRight;
    },
    watch: {
        'deckProperties.heroName': function(x) {
            Vue.nextTick(() => {
                const heroNameText = this.$el.querySelector('.hero .name .xl.content');
                const width = heroNameText.scrollWidth;

                heroNameText.style['transform'] = 'scaleX(1)';
                if (width > this.initialWidth) {
                    heroNameText.style['transform'] =`scaleX(${this.initialWidth/width})`;
                    heroNameText.style['transform-origin'] = 'left bottom';
                }
            });
        }
    }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="less">

@corner: 1.5mm;
@thick-border-width: 1mm;
@thin-border-width: 0.4mm;
@thinner-border-width: 0.2mm;

@media print {
  * {
    -webkit-transition: none !important;
    transition: none !important;
    zoom: 1 !important;
  }
}

.printnplay {
    &.card {
        border-radius: 0;
        background: var(--inner-border-colour);
    }
}

.inner-border {
    background: var(--inner-border-colour);
    border-color: var(--inner-border-colour);
}

.card {
    width: 63mm;
    height: 88mm;
    background: var(--outer-border-colour);
    padding: 3mm;

    border-radius: 2.5mm;
}

.main-wrapper {
    overflow: hidden;
    border-radius: @corner;
}

.panel {
    height: 19.6mm;
    background: #FFF;

    &.abilities {
        height: 40.4mm + 2*@thick-border-width;
        background: #FFF;
        border-top: @thick-border-width solid var(--inner-border-colour);
        border-bottom: @thick-border-width solid var(--inner-border-colour);

        .section {
            height: 100%;
            padding-top: 4.7mm;
        }

        .mixed-case {
            font-family: League Gothic, sans-serif;
        }

    }

    .xl {
        font-size: 9mm;
        white-space: nowrap;
    }

    .content {
        margin-left: 3.9mm; // gutter width
        padding-left: 1.7mm;
        padding-right: 1.7mm;
    }
}

.section {
    &.name {
        height: 11.5mm; // Has this included the border?
        border-bottom: @thin-border-width solid var(--inner-border-colour);

        padding-top: 1.7mm;

    }
    &.attack-health {
        height: 8.1mm;
        overflow: hidden;
        .section {
            padding-top: 1.3mm;
        }
    }
}

.gutter {
    float: left;
    height: 100%;
    width: 3.9mm; // includes border
    border-right: @thinner-border-width solid var(--inner-border-colour);
    position: relative;

    h1 {
        color: #999;

        bottom: 1mm;
        left : 3.4mm;
        white-space: nowrap;
        padding: 0;
        margin: 0;
        transform: rotate(-90deg);
        position: absolute;
        transform-origin: left bottom;
        text-align: left;
        text-transform: uppercase;
        font-size: 2.5mm;
    }
}

.attack {
    height: 100%;
    width: 38.2mm + @thin-border-width;
    float: left;
    border-right: @thin-border-width solid var(--inner-border-colour);

    .icon {
        &.ranged {
            width: 83%;
        }
        &.melee {
            width: 78%;
        }
        margin-left: 1mm;
        margin-top: -0.5mm;
    }
}

.special {
    height: 100%;
    width: 47.4mm;
    float:left;
}

.move {
    position: relative;
    margin-left: 47.4mm;
    padding-top: 0mm !important;

    .arrow {
        position: absolute;
        height: 100%;
        left: -0.95mm;

        img {
            height: 100%;
            transform: scaleY(0.95);
        }
    }

    .value {
        height: 20mm;
        text-align: center;
        font-size: 18mm;
        transform: scaleX(0.75) scaleY(1.25);
    }

    .title {
        height: 19.2mm;
        padding-left: 2.5mm;
        img {
            height: 100%;
        }
    }
}

.health {
    height: 100%;
    margin-left: 38.2mm + @thin-border-width;
    position: relative;
    .gutter {
        width: 6.3mm;
        h1 {
            left: 5.4mm;
            white-space: initial;
            line-height: 0.9em;
        }
    }

    svg {
        position: absolute;
        bottom: 0;
    }
}

.hp {
    position: relative;
    text-align: center;
    font-size: 3.8mm;
    margin-top: 0.8mm;
    margin-right: 0.2mm;
}
</style>
