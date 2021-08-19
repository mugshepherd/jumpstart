const temp = (input) => {
  if (typeof input !== 'string') return '';
  return input.replace(/[aeiou]/gim, '');
};

module.exports = {
  temp,
};
