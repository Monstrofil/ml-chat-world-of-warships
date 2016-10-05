import os
from xml.dom.minidom import parse, parseString
from xml.dom.minidom import Node
BUILD_DIR = "build"
FILE_PATH = os.path.join(BUILD_DIR, "gui/battle_elements.xml")

doc = parse(FILE_PATH)

def remove_blanks(node):
    for x in node.childNodes:
        if x.nodeType == Node.TEXT_NODE:
            if x.nodeValue:
                x.nodeValue = x.nodeValue.strip()
        elif x.nodeType == Node.ELEMENT_NODE:
            remove_blanks(x)
remove_blanks(doc)

for i in doc.documentElement.childNodes:
    if i.nodeName == 'elementList':
        swfref = parseString("""<element name="blank_chat" 
                                         class="MLChatApplicationView" 
                                         url="ml-chat-world-of-warships.swf">
                                    <properties hitTest = 'false'/>
                                </element>""").documentElement
        i.insertBefore(swfref, i.childNodes[-1])
    
    if i.nodeName == 'controllers':        
        for controller in [k for k in i.childNodes if k.nodeName == 'element']:
            if controller._attrs.get('class', None).childNodes[0].nodeValue == 'lesta.dialogs.battle_window_controllers.ComplainController':
                controller._attrs['class'] = 'com.monstrofil.ComplainController'
        
        
with open(FILE_PATH, 'w') as f:
    f.write(doc.toprettyxml())