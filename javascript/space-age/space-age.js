var SpaceAge = function(value) {
  this.seconds = value;
};

SpaceAge.prototype.seconds = 0;

SpaceAge.prototype.getAge = function(factor) {
  return Math.round(this.seconds / factor * 100) / 100;
};

SpaceAge.prototype.onEarth   = function() { return this.getAge(31557600); };
SpaceAge.prototype.onMercury = function() { return this.getAge(7600543.81992); };
SpaceAge.prototype.onVenus   = function() { return this.getAge(19414149.052176); };
SpaceAge.prototype.onMars    = function() { return this.getAge(59354032.69008); };
SpaceAge.prototype.onJupiter = function() { return this.getAge(374355659.124); };
SpaceAge.prototype.onSaturn  = function() { return this.getAge(929292362.8848); };
SpaceAge.prototype.onUranus  = function() { return this.getAge(2651370019.3296); };
SpaceAge.prototype.onNeptune = function() { return this.getAge(5200418560.032); };

module.exports = SpaceAge;
