var Trinary = require('./trinary');

describe('Trinary', function () {

  it('1 is decimal 1', function() {
    expect(new Trinary('1').toDecimal()).toEqual(1);
  });

  it('2 is decimal 2', function() {
    expect(new Trinary('2').toDecimal()).toEqual(2);
  });

  it('10 is decimal 3', function() {
    expect(new Trinary('10').toDecimal()).toEqual(3);
  });

  it('11 is decimal 4', function() {
    expect(new Trinary('11').toDecimal()).toEqual(4);
  });

  it('100 is decimal 9', function() {
    expect(new Trinary('100').toDecimal()).toEqual(9);
  });

  it('112 is decimal 14', function() {
    expect(new Trinary('112').toDecimal()).toEqual(14);
  });

  it('222 is 26', function() {
    expect(new Trinary('222').toDecimal()).toEqual(26);
  });

  it('1122000120 is 32091', function() {
    expect(new Trinary('1122000120').toDecimal()).toEqual(32091);
  });

  it('invalid trinary is decimal 0', function() {
    expect(new Trinary('carrot').toDecimal()).toEqual(0);
  });

});
