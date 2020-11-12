.phony: all clean

all: hello


main.o: main.m ExampleClass-Swift.h
	clang -c $< -o $@

ExampleClass.o: ExampleClass.swift ExampleClass-Swift.h
	swiftc -emit-object -parse-as-library $<

ExampleClass-Swift.h: ExampleClass.swift
	swiftc $< -emit-objc-header -emit-objc-header-path $@

hello: main.o ExampleClass.o
	swiftc $^ -o $@ -framework Foundation

clean:
	$(RM) hello *.o *.{swiftdoc,swiftmodule,swiftsourceinfo} ExampleClass ExampleClass-Swift.h

