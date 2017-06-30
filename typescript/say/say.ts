export default class Say {
    private numbers: {[key: number]: string} = {
        1: 'one', 2: 'two', 3: 'three', 4: 'four', 5: 'five',
        6: 'six', 7: 'seven', 8: 'eight', 9: 'nine', 10: 'ten',
        11: 'eleven', 12: 'twelve', 13: 'thirteen', 14: 'fourteen', 15: 'fifteen',
        16: 'sixteen', 17: 'seventeen', 18: 'eighteen', 19: 'nineteen', 20: 'twenty',
        30: 'thirty', 40: 'forty', 50: 'fifty', 60: 'sixty', 70: 'seventy', 80: 'eighty', 90: 'ninty'
    }

    private chunks: Array<{[key:string]: any}> = [
        // { 'word': 'trillion', 'number': 1e12 },
        { 'word': 'billion', 'number': 1e9 },
        { 'word': 'million', 'number': 1e6 },
        { 'word': 'thousand', 'number': 1e3 },
        { 'word': '', 'number': 1e0 }
    ]

    inEnglish(number: number): string {
        if (number < 0 || number >= 1e12) {
            throw 'Number must be between 0 and 999,999,999,999.';
        }
        if (number == 0) { return 'zero'; }

        let numberString = '';
        let sayAnd = false;

        this.chunks.forEach((chunk) => {
            let part = Math.trunc(number / chunk.number);
            if (part > 0) {
                numberString += `${this.sayTriplet(part)} ${chunk.word} `;
            } else {
                if (numberString.length > 1) {
                    sayAnd = true;
                }
            }

            number -= part * chunk.number;
        });

        return numberString.trim();
    }

    private sayTriplet(number: number): string {
        let numberString: string = '';
        let seperator: string = ' ';
        let hundredsPart = Math.trunc(number/100);

        if (hundredsPart > 0) {
            numberString+= `${this.sayTriplet(hundredsPart)} hundred`;
            number = number - hundredsPart * 100;
        }

        while (number > 0) {
            let largestPart = Math.max.apply(null,
                Object.keys(this.numbers)
                    .filter((i) => parseInt(i) <= number)
            );

            numberString += seperator + this.numbers[largestPart];

            if (20 <= largestPart && largestPart <= 90) {
                seperator = '-';
            } else {
                seperator = ' ';
            }

            number -= largestPart
        }

        return numberString.trim();
    }
}