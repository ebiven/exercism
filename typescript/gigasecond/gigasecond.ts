export default class Gigasecond {
    private dt: Date;

    constructor(dt: Date) {
        this.dt = dt;
    }

    date(): Date {
        return new Date(this.dt.getTime() + 1e12);
    }
}