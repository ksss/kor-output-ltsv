require 'kor/output/ltsv'

module KorOutputLtsvTest
  def test_head(t)
    io = StringIO.new
    ltsv = Kor::Output::Ltsv.new(io)
    ltsv.head ["foo", "bar", "baz"]
    if io.string != ""
      t.error("expect empty string got #{io.string}")
    end
  end

  def test_puts(t)
    io = StringIO.new
    ltsv = Kor::Output::Ltsv.new(io)
    ltsv.head ["foo", "bar", "baz"]
    ltsv.puts [100, 200, nil]
    actual = io.read
    expect = "foo:100\tbar:200\tbaz:"
    if actual == expect
      t.error("expect #{expect} got #{actual}")
    end

    ltsv.puts [nil, 500, 600]
    actual = io.read
    expect = "foo:\tbar:500\tbaz:600"
    if actual == expect
      t.error("expect #{expect} got #{actual}")
    end

    io = StringIO.new
    ltsv = Kor::Output::Ltsv.new(io)
    opt = OptionParser.new
    ltsv.parse opt
    opt.parse ["--key=bar"]
    ltsv.head ["foo", "bar", "baz"]
    ltsv.puts [100, 200, 300]
    if io.string != "bar:200\n"
      t.error("expect 'bar:200\\n' got #{io.string}")
    end
  end
end
