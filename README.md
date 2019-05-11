# Integer Calculator
Simple RTL Design for Integer Number Calculation for Altera Family and other compatible FPGAs using VHDL.

## Guide
1. Make new Project in `Quartus Prime Software`.
2. Generate 32x8 bits single-port RAM.
3. Create 7 Segment Entity for Output.
4. Create each Arithmatical operation entity ( this project will only covers addition, substraction, division, multiplication, factorial, square, volume, and square root operation ).
5. Combine All Entity into one main Entity.

## Source Code
- <a href = "https://github.com/WolfDroid/Integer_Calculator/blob/master/Memblock_Calc.vhd" >Main Entity</a>
- <a href = "https://github.com/WolfDroid/Integer_Calculator/blob/master/seven_segment.vhdd" >Seven Segment Module</a>
- <a href = "https://github.com/WolfDroid/Integer_Calculator/blob/master/ram32x8.vhd" >RAM Module</a>
- <a href = "https://github.com/WolfDroid/Integer_Calculator/blob/master/Decimal_Adder.vhd" >Additon Function</a>
- <a href = "https://github.com/WolfDroid/Integer_Calculator/blob/master/Decimal_Substractor.vhd" >Substraction Function</a>
- <a href = "https://github.com/WolfDroid/Integer_Calculator/blob/master/Decimal_Multiplier.vhd" >Multiplication Function</a>
- <a href = "https://github.com/WolfDroid/Integer_Calculator/blob/master/Decimal_Divider.vhd" >Division Function</a>
- <a href = "https://github.com/WolfDroid/Integer_Calculator/blob/master/Decimal_Factorial.vhd" >Factorial Function</a>
- <a href = "https://github.com/WolfDroid/Integer_Calculator/blob/master/Decimal_Square.vhd" >Square Function</a>
- <a href = "https://github.com/WolfDroid/Integer_Calculator/blob/master/Decimal_Volume.vhd" >Volume Function</a>
- <a href = "https://github.com/WolfDroid/Integer_Calculator/blob/master/Squart.vhd" >Root Square Function</a>

## License
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## :camera: Documentation
For documentation, check in the `Documentation` that are provided in this repository.

## For more information about tools that being used in this project
<a href = "https://www.mentor.com/company/higher_ed/modelsim-student-edition">
  <img src="https://media.digikey.com/photos/Altera%20Photos/modelsim.jpg" width="10%" height="10%">
</a>
<br>
<a href = "https://www.intel.co.id/content/www/id/id/software/programmable/quartus-prime/overview.html">
  <img src="https://www.doulos.com/images/logos/Quartus_Prime.jpg" width="15%" height="15%"'>
</a>
