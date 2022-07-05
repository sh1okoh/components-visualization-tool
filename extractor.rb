require 'parser'

class Extractor
  include AST::Processor::Mixin

  @@d=0

  def indent(n)
    n.times do
	    print " "
	  end
  end
  
  def decode(node)
	  puts
	  if node.is_a?(AST::Node)
      @@d = @@d + 1
      process(node) 
      @@d = @@d - 1
	  elsif node.is_a?(Symbol)
      indent(@@d)
      print "<symbol>:%s</symbol>" % node.to_s.encode(xml: :text)
	  else
      indent(@@d)
      print "<nil/>"
	  end
  end

  def on_def(node)
	  cs = node.children
    indent(@@d)
    print "<def n=\"%d\" " % (cs.length - 1)
    print "name=\"%s\">" % cs[0].to_s

    (1..cs.length-1).each do |k|
      decode(cs[k])
    end
	
    indent(@@d)
    print "</def>"
  end

  def on_const(node)
    indent(@@d)
    print "<const>%s</const>" % const_sub(node).encode(xml: :text)
  end
  
  def const_sub(node)
    if node.is_a?(AST::Node)
  	  c0 = node.children[0]
	    c1 = node.children[1]
	    return "%s:%s" % [const_sub(c0), const_sub(c1)]
	  else
	    return node.to_s.encode(xml: :text)
	  end
  end
  
  def on_class(node)
    c0 = node.children[0]
    c1 = node.children[1] # nil
    c2 = node.children[2]
    indent(@@d)
    print "<class n=\"%d\" " % (node.children.length - 2)
    print "name=\"%s\">" % const_sub(c0)
   
	  decode(c2)
    indent(@@d)
	  print "</class>"
  end
   
  def on_int(node)
    indent(@@d)
	  print "<int>%s</int>" % node.children[0].to_s.encode(xml: :text)
  end
  
  def on_str(node)
    indent(@@d)
	  print "<string>%s</string>" % (node.children[0].to_s.encode(xml: :text))
  end
    
  def handler_missing(node)
	  indent(@@d)
	  print "<%s n=\"%d\">" % [node.type, node.children.length]
    node.children.each do |child|
	    decode(child)
    end
    puts
    indent(@@d)
    print "</%s>" % node.type
  end 
end

ARGV.each do |path|
  #puts path
  expr = Parser::CurrentRuby.parse(File.read(path))
  puts "expr"
  puts expr
  Extractor.new.process(expr)
  #puts expr.to_sexp
end