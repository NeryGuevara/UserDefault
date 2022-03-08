//
//  ViewController.swift
//  UserDafaultAPP
//
//  Created by Felipe Nery Guevara Guevara on 21/01/22.
//

import UIKit

class ViewController: UIViewController {
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    var titulo = UILabel()
    var notaLabel = UILabel()
    var botonGuardado = UIButton()
    var texto = UITextView()
    var botonMostrar = UIButton()
    var botonBorrar = UIButton()
    var nocturnoLabel = UILabel()
    var nocturno = UISwitch()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        initUI()
        
        modoNocturno()
        
    }

    func initUI(){
        titulo = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: height/10))
        titulo.backgroundColor = .yellow
        titulo.text = "UserDefaults"
        titulo.textAlignment = .center
        
        view.addSubview(titulo)
        
        notaLabel = UILabel(frame: CGRect(x: width/3, y: height/10, width: width/3, height: height/10))
        notaLabel.text = "Nota:"
        notaLabel.adjustsFontSizeToFitWidth = true
        notaLabel.textAlignment = .center
        notaLabel.textColor = .black
        
        view.addSubview(notaLabel)
        
        texto = UITextView(frame: CGRect(x: 20, y: height/5, width: width - 40, height: height/5))
        texto.textAlignment = .center
        texto.backgroundColor = .white
        texto.layer.cornerRadius = 15
        texto.layer.borderColor = UIColor.black.cgColor
        texto.layer.borderWidth = 1
        
        view.addSubview(texto)
        
        botonGuardado = UIButton(frame: CGRect(x: width - width/4 - 10, y: height/10 - height/20 - 10, width: width/4, height: height/20))
        botonGuardado.backgroundColor = .orange
        botonGuardado.setTitle("Guardar", for: .normal)
        botonGuardado.layer.cornerRadius = 10
        botonGuardado.addTarget(self, action: #selector(botonGuardadoAction), for: .touchUpInside)
        
        view.addSubview(botonGuardado)
        
        botonMostrar = UIButton(frame: CGRect(x: width/3, y: 17*height/40, width: width/3, height: height/20))
        botonMostrar.backgroundColor = .orange
        botonMostrar.setTitle("Mostar", for: .normal)
        botonMostrar.layer.cornerRadius = 10
        botonMostrar.addTarget(self, action: #selector(mostrar), for: .touchUpInside)
        
        view.addSubview(botonMostrar)
        
        botonBorrar = UIButton(frame: CGRect(x: width/3, y: height/2, width: width/3, height: height/20))
        botonBorrar.backgroundColor = .red
        botonBorrar.setTitle("Borrar", for: .normal)
        botonBorrar.layer.cornerRadius = 10
        botonBorrar.addTarget(self, action: #selector(eliminar), for: .touchUpInside)
        
        view.addSubview(botonBorrar)
        
        nocturno = UISwitch(frame: CGRect(x: 3*width/8, y: 13*height/20, width: width/2, height: height/2))
        nocturno.addTarget(self, action: #selector(cambio), for: .touchUpInside)
        
        nocturno.isOn = UserDefaults.standard.bool(forKey: "estatus")
        
        view.addSubview(nocturno)
        
    }
    
    @objc func botonGuardadoAction(_ sender: UIButton){
        UserDefaults.standard.set(texto.text, forKey: "texto")
        texto.text = ""
    }
    
    @objc func mostrar(){
        texto.text = UserDefaults.standard.object(forKey: "texto") as? String
    }
    
    @objc func eliminar(_ sender: UIButton){
        UserDefaults.standard.removeObject(forKey: "texto")
        texto.text = ""
    }
    
    @objc func cambio(_ sender: UISwitch){
        if nocturno.isOn{
            notaLabel.textColor = .white
            self.view.backgroundColor = .black
            UserDefaults.standard.set(nocturno.isOn, forKey: "estatus")
        }else{
            notaLabel.textColor = .black
            self.view.backgroundColor = .white
            UserDefaults.standard.removeObject(forKey: "estatus")
        }
    }
    
    func modoNocturno(){
        if UserDefaults.standard.bool(forKey: "estatus"){
            notaLabel.textColor = .white
            self.view.backgroundColor = .black
        }
    }
    
    

}

