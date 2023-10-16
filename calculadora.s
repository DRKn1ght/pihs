.data
    float_var1:     .float 3.14        # First float value
    float_var2:     .float 2.71        # Second float value
    format_string:  .asciz "Sum: %f\n" # Format string for printing

.text
.globl main

main:
    # Initialize FPU
    finit

    # Load the first float value onto the FPU stack
    flds float_var1

    # Load the second float value onto the FPU stack
    flds float_var2

    # Add the two values and replace them with the result
    faddp

    # Store the result back in float_var1 (or any other variable)
    fstps float_var1

    # Print the result
    sub $8, %esp            # Adjust stack pointer
    flds float_var1         # Load the result onto the FPU stack
    push $format_string     # Push the format string onto the stack
    call printf            # Call printf function
    add $8, %esp            # Clean up the stack

    # Exit the program
    mov $0, %eax
    leave
    ret
