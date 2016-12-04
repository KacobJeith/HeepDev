from HTMLParser import HTMLParser
from htmlentitydefs import name2codepoint


class SVGParser(HTMLParser):

    icon = {}

    def handle_starttag(self, tag, attrs):
        print "Start tag:", tag
        self.icon[tag] = {}
        for attr in attrs:
            print "     attr:", attr[0]
            self.icon[tag][attr[0]] = attr[1]

    def handle_endtag(self, tag):
        print "End tag  :", tag

    def handle_data(self, data):
        print "Data     :", data

    def handle_comment(self, data):
        print "Comment  :", data

    def handle_entityref(self, name):
        c = unichr(name2codepoint[name])
        print "Named ent:", c

    def handle_charref(self, name):
        if name.startswith('x'):
            c = unichr(int(name[1:], 16))
        else:
            c = unichr(int(name))
        print "Num ent  :", c

    def handle_decl(self, data):
        print "Decl     :", data