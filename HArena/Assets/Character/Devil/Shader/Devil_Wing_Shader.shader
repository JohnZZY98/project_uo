// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Devil_Wing_Material"
{
	Properties
	{
		_Devil_wing_D("Devil_wing_D", 2D) = "white" {}
		_Devil_wing_layered("Devil_wing_layered", 2D) = "white" {}
		_Devil_wing_N("Devil_wing_N", 2D) = "white" {}
		[HDR]_Wing_Emission_Color("Wing_Emission_Color", Color) = (1,1,1,0)
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _Devil_wing_N;
		uniform float4 _Devil_wing_N_ST;
		uniform sampler2D _Devil_wing_D;
		uniform float4 _Devil_wing_D_ST;
		uniform float4 _Wing_Emission_Color;
		uniform sampler2D _Devil_wing_layered;
		uniform float4 _Devil_wing_layered_ST;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_Devil_wing_N = i.uv_texcoord * _Devil_wing_N_ST.xy + _Devil_wing_N_ST.zw;
			o.Normal = tex2D( _Devil_wing_N, uv_Devil_wing_N ).rgb;
			float2 uv_Devil_wing_D = i.uv_texcoord * _Devil_wing_D_ST.xy + _Devil_wing_D_ST.zw;
			o.Albedo = tex2D( _Devil_wing_D, uv_Devil_wing_D ).rgb;
			float2 uv_Devil_wing_layered = i.uv_texcoord * _Devil_wing_layered_ST.xy + _Devil_wing_layered_ST.zw;
			o.Emission = ( _Wing_Emission_Color * ( 1.0 - tex2D( _Devil_wing_layered, uv_Devil_wing_layered ).b ) ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16400
535;338;1576;907;1457.333;-64.92993;1.6;True;False
Node;AmplifyShaderEditor.SamplerNode;2;-948.9999,536.7;Float;True;Property;_Devil_wing_layered;Devil_wing_layered;1;0;Create;True;0;0;False;0;5c072416d19902142b5f0ae03835d7c3;5c072416d19902142b5f0ae03835d7c3;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;7;-584.1998,616.8997;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;5;-734.3999,297.7;Float;False;Property;_Wing_Emission_Color;Wing_Emission_Color;3;1;[HDR];Create;True;0;0;False;0;1,1,1,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;6;-378.8,454.0999;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;3;-454,71.5;Float;True;Property;_Devil_wing_N;Devil_wing_N;2;0;Create;True;0;0;False;0;ad42b4ace4046c24992119e663002d4e;ad42b4ace4046c24992119e663002d4e;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;1;-456,-129.5;Float;True;Property;_Devil_wing_D;Devil_wing_D;0;0;Create;True;0;0;False;0;da584f7d283e46346bc7b72c9991a35e;da584f7d283e46346bc7b72c9991a35e;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;Devil_Wing_Material;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;7;0;2;3
WireConnection;6;0;5;0
WireConnection;6;1;7;0
WireConnection;0;0;1;0
WireConnection;0;1;3;0
WireConnection;0;2;6;0
ASEEND*/
//CHKSM=5A0C3D5569DEC9297CAECDE12DFDB8841F6EE7B1