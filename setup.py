from setuptools import setup

setup(
    name='happy_day',
    version='0.1.0',
    py_modules=['birthday_message'],
    description='A small script that prints a Happy Birthday message (English & Arabic).',
    author='aloosh0900223344-eng',
    classifiers=[
        'Programming Language :: Python :: 3',
        'License :: OSI Approved :: MIT License',
        'Operating System :: OS Independent',
    ],
    entry_points={
        'console_scripts': [
            'happy-birthday=birthday_message:print_happy_birthday',
        ],
    },
    python_requires='>=3.6',
)
