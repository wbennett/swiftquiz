//
//  PBContainer.swift
//  Quiz
//
//  Created by William Bennett on 6/7/14.
//  Copyright (c) 2014 William Bennett. All rights reserved.
//

import Foundation

class Kernel {
	var _internal: Dictionary<String,Binder>
	init(){
		_internal = Dictionary<String,Binder>()
	}
	func bind<T: AnyObject>()-> Binding<T>{
		var binding = Binding<T>();
		var name = NSStringFromClass(Binding<T>)
		println(name)
		
		//if a class get's rebound, it will blow it away.
		if(_internal[name] != nil)
		{
			_internal[name] = nil
		}
		_internal[name] = binding
		
		return binding
	}
}

protocol Binder {
	
}

class Binding<T: AnyObject> : Binder {
	var _provider: (()-> T)?
	init(){
	}
	
	func to(provider: () -> T){
		self._provider = provider
	}
	
}

class Container {
	var kernel: Kernel
	
	init(){
		self.kernel = Kernel()
	}
	
	/*
	singleton
	*/
	class var instance: Container{
    	get {
			struct Static {
				static var instance : Container? = nil
				static var token: dispatch_once_t = 0
			}

			dispatch_once(&Static.token){
				Static.instance = Container()
			}
			
			return Static.instance!
    	}
	}
	
	class func resolve<T: AnyObject>() -> T {
		var name = NSStringFromClass(Binding<T>)
		
		println(name)
		var binding = instance.kernel
			._internal[name] as Binding<T>
		
		return binding._provider!()
	}
}