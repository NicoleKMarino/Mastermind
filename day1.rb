def upcase_word(words)
final = words.split.map(&:upcase).join(" ")
puts final
end

upcase_word("test")


def substring_word(text,first,second)
  final= text [first..second]
  puts final
end

substring_word("pizza",3,4)




def sub(text,first,second)
  text[0]= first
  text[2]=second
  puts text
end

sub("dog","g","d")


def gsub(text,first,second)
  final= text.tr(first,second)
  puts final
end

gsub("dog","g","d")

def split_word(text)
    final = text.to_a
end

split_word("hello dear friend")
