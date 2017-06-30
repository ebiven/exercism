export default class SpaceAge {
  seconds: number;

  constructor(seconds: number) {
    this.seconds = seconds;
  }

  getAge(factor: number): number {
    return Math.round(this.seconds / factor * 100) / 100;
  }

  onEarth()   { return this.getAge(31557600); };
  onMercury() { return this.getAge(7600543.81992); };
  onVenus()   { return this.getAge(19414149.052176); };
  onMars()    { return this.getAge(59354032.69008); };
  onJupiter() { return this.getAge(374355659.124); };
  onSaturn()  { return this.getAge(929292362.8848); };
  onUranus()  { return this.getAge(2651370019.3296); };
  onNeptune() { return this.getAge(5200418560.032); };
}