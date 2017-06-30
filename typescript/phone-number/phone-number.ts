export default class PhoneNumber {
    private formatted: string|undefined;

    constructor(raw: string) {
        let formatted = this.cleanRawPhoneNumber(raw);
        formatted = this.stripCountryCode(formatted);
        if (!this.onlyDigits(formatted) || formatted.length != 10) { formatted = undefined; }
        this.formatted = formatted;
    }

    number(): string|undefined {
        return this.formatted;
    }

    private cleanRawPhoneNumber = (n: string): string => n.replace(/[ ()\.-]/g, '').trim();
    
    private onlyDigits = (n: string): boolean => /^[0-9]+$/.test(n);
    
    private stripCountryCode = (n: string): string => {
        if (n.length == 11 && n.startsWith('1')) {
            return n.slice(1);
        }
        return n;
    };
}