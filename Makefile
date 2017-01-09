
run: simulator.jar antlr-3.4-complete.jar src/arch/y86/machine/seq/student/CPU.class
	java -cp antlr-3.4-complete.jar:simulator.jar:src SimpleMachine -i gui -a y86-seq -v student
src/arch/y86/machine/seq/student/CPU.class: src/arch/y86/machine/seq/student/CPU.java
	javac -cp antlr-3.4-complete.jar:simulator.jar:. src/arch/y86/machine/seq/student/CPU.java

