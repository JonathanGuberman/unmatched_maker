export default function serializeToHuman(deck) {
    const heroOutput = `
${deck.hero.name.trim()}
${deck.hero.isRanged ? 'Ranged': 'Melee'}
HP: ${deck.hero.hp} Move: ${deck.hero.move}
"${deck.hero.specialAbility.trim()}"`.trim();

    var sidekickOutput = ``;
    if (deck.sidekick.quantity === 1) {
        sidekickOutput = `
${deck.sidekick.name.trim()}
${deck.sidekick.isRanged ? 'Ranged': 'Melee'}
HP: ${deck.sidekick.hp}`
    } else if (deck.sidekick.quantity > 1) {
        sidekickOutput = `
${deck.sidekick.name.trim()} x${deck.sidekick.quantity}
${deck.sidekick.isRanged ? 'Ranged': 'Melee'}`
    }

    var cardsOutput = '';
    var currentCharacterName = '';

    deck.cards.forEach(card => {
        var cardOutput = '\n\n';

        const characterName = card.characterName.trim().toUpperCase();
        if (characterName != currentCharacterName) {
            currentCharacterName = characterName
            cardOutput += `${currentCharacterName}\n`
        }


        cardOutput += `${card.quantity}x ${card.title.trim()}\n`

        if (card.type === 'scheme') {
            cardOutput += `S B${card.boost}\n`
            cardOutput += `"${card.basicText.trim()}"\n`
        } else {
            cardOutput += `${card.type[0].toUpperCase()}${card.value} B${card.boost}\n`
            if (card.immediateText) {
                cardOutput += `IMMEDIATELY: "${card.immediateText.trim()}"\n`
            }
            if (card.duringText) {
                cardOutput += `DURING COMBAT: "${card.duringText.trim()}"\n`
            }
            if (card.afterText) {
                cardOutput += `AFTER COMBAT: "${card.afterText.trim()}"\n`
            }
        }

        if (card.imageUrl) {
            cardOutput += `URL: ${card.imageUrl.trim()}\n`
        }

        cardsOutput += cardOutput.trimEnd()
    });

    const appearance = `\n\n*${JSON.stringify(deck.appearance)}*`;

    return `${heroOutput}${sidekickOutput}${cardsOutput}${appearance}`.trim()
}