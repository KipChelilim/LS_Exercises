class TextAnalyzer
  def process
    raise(ArgumentError, "Expecting a block argument") unless block_given?
    yield(File.read("sample_text.txt"))
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").size} paragraphs" }
analyzer.process { |text| puts "#{text.split("\n").size} lines" }
analyzer.process { |text| puts "#{text.split.size} words" }

