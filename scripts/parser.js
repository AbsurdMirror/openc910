class SimpleCodeParser {
    constructor(rules) {
        this.rules = rules.map(rule => ({
            ...rule,
            regex: new RegExp(rule.pattern)
        }));
    }

    parse(inputString) {
        for (let rule of this.rules) {
            const match = inputString.match(rule.regex);
            if (match) {
                const result = rule.callback(match);
                if (result) {
                    const matches = {
                        ...result,
                        match: match.slice(1) // Exclude the full match (match[0])
                    };
                    return matches;
                }
            }
        }

        return false;
    }
}

module.exports = SimpleCodeParser;
