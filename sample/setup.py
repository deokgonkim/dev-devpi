import setuptools

with open("README.md", "r", encoding="utf-8") as fh:
    long_description = fh.read()

setuptools.setup(
    name="sample",
    version="0.0.1",
    author="Deokgon Kim",
    author_email="dgkim@dgkim.net",
    description="This is sample project to show how to use devpi",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/deokgonkim/dev-devpi",
    packages=setuptools.find_packages(),
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
    python_requires='>=3.6',
)
