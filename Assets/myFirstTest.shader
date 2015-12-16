Shader "MyShader/first" {
	Properties {
		_Color ("Color", Color) = (1,1,1,1)
		_AmbientColor("AmbientColor",Color) = (1,1,1,1)
		_MainTex ("Albedo (RGB)", 2D) = "white" {}
		_Glossiness ("Smoothness", Range(0,1)) = 0.5
		_Metallic ("Metallic", Range(0,1)) = 0.0
		_Shininess ("Shininess",Range(0.1,1.0)) = 0.2
		_Specular ("Specular",color)=(1,1,1,1)
		_Emission ("Emission",color) = (1,1,1,1)
		_FogColor ("fogColor",color) = (1,1,1,1)
	}
	
	SubShader{
		pass{
			Ztest Greater
			zwrite off
			blend one zero		
		
		}
		
		pass{
		
			fog{Mode Exp2
				Color[_FogColor]
				Density 1
				Range 0,10
			}
			Material{
				Diffuse [_Color]
				Ambient [_AmbientColor]
				Shininess [_Shininess]
				Specular [_Specular] 
				Emission [_Emission]
			}
			lighting on
			SeparateSpecular on
	
			setTexture[_MainTex]{
			
				combine texture*primary DOUBLE
		
			}
		}
	}
	
	
	//FallBack "Diffuse"
}
