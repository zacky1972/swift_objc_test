.phony: all clean

all: hello


main.o: main.m ExampleClass-Swift.h
	xcrun clang -c $< -o $@

ExampleClass.o: ExampleClass.swift ExampleClass-Swift.h
	xcrun swiftc -emit-object -parse-as-library $<

ExampleClass-Swift.h: ExampleClass.swift
	xcrun swiftc $< -emit-objc-header -emit-objc-header-path $@

hello: main.o ExampleClass.o
	xcrun swiftc $^ -o $@ -framework Foundation

clean:
	$(RM) hello *.o *.{swiftdoc,swiftmodule,swiftsourceinfo} ExampleClass ExampleClass-Swift.h

