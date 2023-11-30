import isDefined from "./is-defined";

/**
 * Return true if the given value is not blank.
 * @param {*} value - The value to check.
 * @returns {Boolean}
 */
export default function isPresent(value) {
  return isDefined(value) && value.length > 0;
}
