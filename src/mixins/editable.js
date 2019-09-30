export default {
    methods: {
        updateEditableText: function (prop, event) {
            const newTitle = event.target.innerText;
            this.$emit('update:' + prop, newTitle);
        },
        focusEditableText: function(event) {
            event.currentTarget.lastChild.focus();
        },
    }
}