DECK -> CHARACTER (blank CARDLIST {% d => d[1] %}):?  (blank APPEARANCE {% d => d[1] %}):? _
            {% d=>  {return {...d[0], cards: d[1], metadata: d[2]}} %}

CHARACTER -> HERO (nl SIDEKICK {% d => d[1] %}):? {% d => {
    return {
        hero: d[0],
        sidekick: d[1] || {quantity: 0}
    }}%}

# The APPEARANCE rule just matches anything between * characters at the end
APPEARANCE -> "*" [^*]:* "*" {% d => d[1].join("") %}

HERO -> NAME nl FIGHTING_TYPE __ HP _ MOVE __ SPECIAL {% d => {return {
    ...d[0], ...d[2], ...d[4], ...d[6], ...d[8]}} %}
SIDEKICK -> NAME nl FIGHTING_TYPE __ HP {% d => {return {...d[0], ...d[2], ...d[4]}} %}
    | NAME __ QUANTITY nl FIGHTING_TYPE {% d => {return {...d[0], ...d[2], ...d[4]}} %}

NAME -> str {% d => {return {'name': d[0]}} %}
FIGHTING_TYPE -> _ "melee"i _ {% d => {return {isRanged: false}} %}
    | _ "ranged"i _ {% d => {return {isRanged: true}} %}
HP -> ("HP"i | "HEALTH"i) delim int {% d => {return {'hp': d[2]}} %}
MOVE -> ("M"i | "MOVE"i) delim int {% d => {return {'move': d[2]}} %}
SPECIAL -> dq_multiline_str {% d => {return {'specialAbility': d[0]}} %}

CARDLIST -> CARDSET (blank CARDSET {% d => d[1] %}):* {% d => [d[0]].concat(d[1]).flat() %}

CARDSET -> USER nl CARDS {% d => d[2].map(card => {card.characterName = d[0]; return card}) %}

CARDS -> CARD (blank CARD {% d => d[1] %}):* {% d => [d[0]].concat(d[1]) %}

CARD -> ADV_CARD {% id %}
    | S_CARD {% id %}

ADV_CARD -> QUANTITY __ TITLE nl ADV_TYPE _ BOOST (_ ADV_EFFECTS {% d=>d[1] %}):? (_ IMAGE {% d=>d[1] %}):? {% d => {
    return {
        ...d[0],
        ...d[2],
        ...d[4],
        ...d[6],
        ...d[7],
        ...d[8],
    }
} %}

S_CARD -> QUANTITY __ TITLE nl S_TYPE _ BOOST _ EFFECT (_ IMAGE {% d=>d[1] %}):? {% d => {
    return {
        ...d[0],
        ...d[2],
        ...d[4],
        ...d[6],
        ...d[8],
        ...d[9],
    }
} %}

USER -> str {% d => d[0] %}
TITLE -> str {% d => {return {title: d[0]}} %}

S_TYPE -> ("S"i | "SCHEME"i) {% d => {return {'type': 'scheme', 'value': 1}} %}
ADV_TYPE -> A {% id %}
    | D {% id %}
    | V {% id %}
A -> ("ATTACK"i | "A"i) delim int {% d => {return {'type': 'attack', 'value': d[2]}} %}
D -> ("DEFENSE"i | "DEFENCE"i | "D"i) delim int {% d => {return {'type': 'defence', 'value': d[2]}} %}
V -> ("VERSATILE"i | "V"i) delim int {% d => {return {'type': 'versatile', 'value': d[2]}} %}
QUANTITY -> int _ "X"i {% d => {return {quantity: d[0]}}  %}
    | "X"i _ int {% d => {return {quantity: d[2]}} %}
BOOST -> "B" delim int {% d => {return {boost: d[2]}} %}
EFFECT -> dq_multiline_str {% d => {return {basicText: d[0]}} %}

ADV_EFFECTS -> IMMEDIATELY:? DURING_COMBAT:? AFTER_COMBAT:? {% d => {return {immediatelyText: d[0], duringText: d[1], afterText: d[2]}} %}
IMMEDIATELY -> nl ("I:"i | "IMMEDIATELY:"i) _ dq_multiline_str {% d => d[d.length-1] %}
DURING_COMBAT -> nl ("D:"i | "DURING COMBAT:"i) _ dq_multiline_str {% d => d[d.length-1] %}
AFTER_COMBAT -> nl ("A:"i | "AFTER COMBAT:"i) _ dq_multiline_str {% d => d[d.length-1] %}

IMAGE -> nl ("URL:"i) str {% d => {return {imageUrl: d[d.length-1]}} %}


dq_multiline_str -> "\"" dstrchar:* "\""  {% d =>  d[1].join("") %}
str -> [^\n]:+ {% function(d) {return d[0].join('')} %}
int -> [0-9]:+ {% (d) => parseInt(d[0].join(''))  %}
blank -> _ nl _ nl {% d => null %}
delim -> _ [:-]:? _ {% function(d) {return null;} %}
nl -> "\n" {% function(d) {return null;} %}

# Whitespace: `_` is optional, `__` is mandatory.
_  -> wschar:* {% function(d) {return null;} %}
__ -> wschar:+ {% function(d) {return null;} %}

wschar -> [ \t\n\v\f] {% id %}

# Modified to allow newlines
dstrchar -> [^\\"] {% id %}
    | "\\" strescape {%
    function(d) {
        return JSON.parse("\""+d.join("")+"\"");
    }
%}

strescape -> ["\\/bfnrt] {% id %}
    | "u" [a-fA-F0-9] [a-fA-F0-9] [a-fA-F0-9] [a-fA-F0-9] {%
    function(d) {
        return d.join("");
    }
%}