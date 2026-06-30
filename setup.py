from pathlib import Path
from setuptools import setup, find_packages

README = Path(__file__).parent / "README.md"
long_description = README.read_text(encoding="utf-8") if README.exists() else ""

setup(
    name="happy_day",
    version="0.1.0",
    description="A small script that prints a Happy Birthday message (English & Arabic).",
    long_description=long_description,
    long_description_content_type="text/markdown",
    author="aloosh0900223344-eng",
    author_email="you@example.com",
    url="https://github.com/aloosh0900223344-eng/Happy-day",
    packages=find_packages(exclude=("tests", "docs")),
    py_modules=["birthday_message"],
    include_package_data=True,
    license="MIT",
    classifiers=[
        "Development Status :: 3 - Alpha",
        "Intended Audience :: Developers",
        "Topic :: Utilities",
        "License :: OSI Approved :: MIT License",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.8",
        "Programming Language :: Python :: 3.10",
        "Operating System :: OS Independent",
    ],
    entry_points={
        "console_scripts": [
            "happy-birthday=birthday_message:print_happy_birthday",
        ],
    },
    install_requires=[
        # Add runtime dependencies here, e.g. "requests>=2.25.1",
    ],
    extras_require={
        "dev": ["pytest", "twine"],
    },
    python_requires=">=3.8",
)
