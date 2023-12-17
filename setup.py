
from setuptools import Extension, setup


module1 = Extension('_markovlv',
                    define_macros = [('FOR_OLE', None),
                                     ('SIMLIB_FOR_VAMOD', None),
                                     ('NORAN2',None)],
                    sources = ['omarkov.i','annmod.cpp',
                                   'annuity.cpp',
                                   'annuity2.cpp',
                                   'capital.cpp',
                                   'glmod.cpp',
                                   'omarkov.cpp',
                                   #'simlib.cpp',
                                   'tableserver.cpp',
                                   'vamod.cpp',
                                   'widdow.cpp',
                                   #'omarkov_wrap.cxx'
                                   ],
                         swig_opts=["-c++","-python"])

setup (name = 'markovlv',
       version = '^2.0',
       description = 'Markov Life Insurance Mathemetics Library',
       author = 'Michael Koller',
       author_email = 'michael.koller@bluemail.ch',
       url = 'https://docs.python.org/extending/building',
       long_description = '''
Markov Life Insurnace
''',
       ext_modules = [module1],
       py_modules = ['omarkov']
        )


