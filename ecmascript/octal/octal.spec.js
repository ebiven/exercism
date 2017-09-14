import Octal from './octal';

describe('octal', () => {
  test('1 is decimal 1', () => {
    expect(new Octal('1').toDecimal()).toEqual(1);
  });

  test('10 is decimal 8', () => {
    expect(new Octal('10').toDecimal()).toEqual(8);
  });

  test('17 is decimal 15', () => {
    expect(new Octal('17').toDecimal()).toEqual(15);
  });

  test('11 is decimal 9', () => {
    expect(new Octal('11').toDecimal()).toEqual(9);
  });

  test('130 is decimal 88', () => {
    expect(new Octal('130').toDecimal()).toEqual(88);
  });

  test('2047 is decimal 1063', () => {
    expect(new Octal('2047').toDecimal()).toEqual(1063);
  });

  test('7777 is decimal 4095', () => {
    expect(new Octal('7777').toDecimal()).toEqual(4095);
  });

  test('1234567 is decimal 342391', () => {
    expect(new Octal('1234567').toDecimal()).toEqual(342391);
  });

  test('invalid is decimal 0', () => {
    expect(new Octal('carrot').toDecimal()).toEqual(0);
  });

  test('considers the digit 8 as invalid', () => {
    expect(new Octal('12345678').toDecimal()).toEqual(0);
  });
});
