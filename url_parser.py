#!/usr/bin/env python

""" Global variable search_vars """
search_vars=[]

def get_vars( url ):
    """ Function takes a url string as an argumenent and returns a list of variables"""
    from urlparse import urlparse
    from urlparse import parse_qs
    o = urlparse(url)
    """  variables avalable 
    o.scheme, o.netloc, o.hostname o.port o.path o.params parse_qs(o.query) o.fragment o.username o.password
    """
    global search_vars
    search_vars=parse_qs(o.query)
    """    
    Variables extracted this list is nt complete
    search_elements=search_vars['elements'][0]
    search_nelements=search_vars['nelements'][0]
    output_id=search_vars['id'][0]
    output_format=search_vars['format'][0]
    auth_email=search_vars['email'][0]
    auth_key=search_vars['key'][0]
    
    return  search_vars
    """




    
def usage_message():
    """ Print message if info is specified"""    
    if ('info' in search_vars):
        print "please take a look at the documentation"



        

def response():
    """  dump a json output complient with the specifications"""


        








    

""" ######################  Test program ##################"""

url="http://example.com/minapi/v1/structures?elements=Si,Al,O&nelements=4&id=true&format=json&info=true&email=user@domain.org&key=hhj667"
variables=get_vars(url)
print search_vars
usage_message()
 
