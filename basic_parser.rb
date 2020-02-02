parser = Grammar.build do
	rule(:lines) { match (many0 {(rule :line)} }
	rule(:line) { {(rule :line)} | {(rule :line)} }
	rule(:statement) { (rule :line) }

	rule(:string) { match (many0 {(rule :string_char)}), between: [(rule :quote), (rule :quote)]}
	rule(:string_char)        { (rule :any_unescaped_char) | (rule :any_escaped_char) }
	rule(:any_unescaped_char) { (anyCharBut %w[" \\]) }
	rule(:any_escaped_char)   { (one "\\") >> ((anyChar %w[" \\ / b f n r t]) | (rule :hexdigits)) }

end