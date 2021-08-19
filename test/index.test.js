const { temp } = require('../src/index');

describe('Placeholder function', () => {
  it('should return the input if a string is submitted', () => {
    const input = 'tst';
    const output = temp(input);
    // console.log(output);
    expect(output).toBe(input);
  });

  it('should return an empty string if input not a string', () => {
    const input = 9;
    const output = temp(input);
    expect(output).toBe('');
  });
  it('if a word with the letter `a` is submitted, it should return the word with the letter `a`', () => {
    const input = 'taste';
    const output = temp(input);
    expect(output).toBe('tst');
  });

  it('a word with vowels is submitted, it should return the word with vowels removed', () => {
    const input = 'the quick brown fox jumped over the lazy dog';
    const output = temp(input);
    expect(output).toBe('th qck brwn fx jmpd vr th lzy dg');
  });
});
