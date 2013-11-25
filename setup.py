import os
import sys

from setuptools import setup, find_packages

here = os.path.abspath(os.path.dirname(__file__))
README = open(os.path.join(here, "README.rst")).read()

requires = ["Sphinx>=1.1.2"]

setup(name="selenium-docs",
      description="Rewrite of the Selenium documentation.",
      long_description=README,
      classifiers=["License :: OSI Approved :: Apache Software License",
                   "Natural Language :: English",
                   "Topic :: Documentation",
                   "Topic :: Internet :: WWW/HTTP :: Browsers",
                   "Topic :: Software Development :: Documentation"
                   "Topic :: Software Development :: Quality Assurance",
                   "Topic :: Software Development :: Testing",
                   "Intended Audience :: Developers"],
      author="Andreas Tolfsen",
      author_email="ato@mozilla.com",
      url="http://seleniumhq.org/docs/",
      keywords="selenium webdriver browser automation",
      packages=find_packages(),
      include_package_data=True,
      zip_safe=False,
      install_requires=requires)
