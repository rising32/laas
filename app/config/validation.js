function sanitizeWord(input,idx) {
	var in_decode = decodeURIComponent(input);
	var in_deli = in_decode.split(/[@?^$*.+-<>{}_\\/\s/]+/);
	return in_deli[idx];
}

module.exports.sanitizeWord = sanitizeWord;