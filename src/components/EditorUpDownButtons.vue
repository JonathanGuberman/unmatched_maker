<template>
    <div>
        <button @click="updateValue(stepValue)" :class="{invalid: isMax}">
            <span class="fa-layers fa-fw fa-2x">
                <i class="fa-inverse fas fa-circle"></i>
                <i class="far fa-caret-circle-up"></i>
            </span>
<!--            <span class="fa-layers fa-fw fa-2x">
              <i class="fa-inverse fas fa-caret-up"></i>
              <i class="far fa-caret-up"></i>
            </span>-->
        </button>
        <button @click="updateValue(-stepValue)" :class="{invalid: isMin}">
            <span class="fa-layers fa-fw fa-2x">
                <i class="fa-inverse fas fa-circle"></i>
                <i class="far fa-caret-circle-down"></i>
            </span>
        </button>
    </div>
</template>

<script>
    export default {
        name: 'EditorUpDownButtons',
        props: {
            value: {
                type: Number,
                required: true
            },
            minValue: {
                type: Number,
            },
            maxValue: {
                type: Number,
            },
            stepValue: {
                type: Number,
                default: 1
            }
        },
        methods: {
            updateValue: function(step) {
                const newValue = this.value + step;
                if ((this.minValue == undefined || newValue >= this.minValue) &&
                    (this.maxValue == undefined || newValue <= this.maxValue))
                {
                    this.$emit('input', newValue)
                }
            }
        },
        computed: {
            isMin: function() {
                return (this.minValue != undefined && this.value === this.minValue)
            },
            isMax: function() {
                return (this.maxValue != undefined && this.value === this.maxValue)
            },
        }
    }
</script>