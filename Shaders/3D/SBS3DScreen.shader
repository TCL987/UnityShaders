// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "3D/SBS3DScreen"
{
	Properties
	{
		[HideInInspector] __dirty( "", Int ) = 1
		[Toggle]_SwapEyes("Swap Eyes", Float) = 0
		_ScreenTexture("Screen Texture", 2D) = "white" {}
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#pragma target 3.5
		#pragma surface surf Unlit keepalpha addshadow fullforwardshadows vertex:vertexDataFunc 
		struct Input
		{
			float2 texcoord_0;
			float2 texcoord_1;
			float2 texcoord_2;
		};

		uniform sampler2D _ScreenTexture;
		uniform fixed _SwapEyes;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float2 temp_cast_0 = (0.5).xx;
			float2 temp_cast_1 = (0.0).xx;
			o.texcoord_0.xy = v.texcoord.xy * temp_cast_0 + temp_cast_1;
			float2 temp_cast_2 = (0.5).xx;
			float2 temp_cast_3 = (0.5).xx;
			o.texcoord_1.xy = v.texcoord.xy * temp_cast_2 + temp_cast_3;
			o.texcoord_2.xy = v.texcoord.xy * float2( 1,1 ) + float2( 0,0 );
		}

		inline fixed4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return fixed4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float lerpResult34 = lerp( i.texcoord_0.x , i.texcoord_1.x , lerp(unity_StereoEyeIndex,( -unity_StereoEyeIndex + 1.0 ),_SwapEyes));
			float2 appendResult51 = (float2(lerpResult34 , i.texcoord_2.y));
			o.Emission = tex2D( _ScreenTexture, appendResult51 ).xyz;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=12001
1767;159;1452;749;91.20552;238.5987;1.3;True;True
Node;StereoEyeIndex;18;-825.0994,567.7006;Float;False;0;1;FLOAT
Node;AmplifyShaderEditor.NegateNode;49;-608.808,674.4011;Float;False;1;0;FLOAT;0.0;False;1;FLOAT
Node;AmplifyShaderEditor.SimpleAddOpNode;50;-430.808,674.4011;Float;False;2;2;0;FLOAT;0.0;False;1;FLOAT;1.0;False;1;FLOAT
Node;AmplifyShaderEditor.RangedFloatNode;38;-824.2,163.4997;Float;False;Constant;_Float0;Float 0;1;0;0.5;0;0;0;1;FLOAT
Node;AmplifyShaderEditor.RangedFloatNode;39;-826.3977,250.4;Float;False;Constant;_Float1;Float 1;1;0;0;0;0;0;1;FLOAT
Node;AmplifyShaderEditor.RangedFloatNode;41;-828.5983,415.4;Float;False;Constant;_Float3;Float 3;1;0;0.5;0;0;0;1;FLOAT
Node;AmplifyShaderEditor.RangedFloatNode;40;-827.4974,335.0994;Float;False;Constant;_Float2;Float 2;1;0;0.5;0;0;0;1;FLOAT
Node;AmplifyShaderEditor.ToggleSwitchNode;47;-242.8082,564.4011;Fixed;False;Property;_SwapEyes;Swap Eyes;1;1;[Toggle];0;2;0;FLOAT;0.0;False;1;FLOAT;0.0;False;1;FLOAT
Node;AmplifyShaderEditor.TextureCoordinatesNode;36;-427.407,343.5999;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.TextureCoordinatesNode;37;-429.1076,190.5996;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.TextureCoordinatesNode;10;0.503952,571.8007;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.LerpOp;34;-3.10711,374.1992;Float;False;3;0;FLOAT;0.0;False;1;FLOAT;0.0;False;2;FLOAT;0.0;False;1;FLOAT
Node;AmplifyShaderEditor.DynamicAppendNode;51;508.0958,64.3007;Float;False;FLOAT2;4;0;FLOAT;0.0;False;1;FLOAT;0.0;False;2;FLOAT;0.0;False;3;FLOAT;0.0;False;1;FLOAT2
Node;AmplifyShaderEditor.SamplerNode;8;757.0021,-29.09985;Float;True;Property;_ScreenTexture;Screen Texture;1;0;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;0.0;False;5;FLOAT4;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;1128.004,-30.1;Float;False;True;3;Float;ASEMaterialInspector;0;Unlit;3D/SBS3DScreen;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;0;False;0;0;Opaque;0.5;True;True;0;False;Opaque;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;False;0;255;255;0;0;0;0;False;0;4;10;25;False;0.5;True;0;Zero;Zero;0;Zero;Zero;Add;Add;0;False;0;0,0,0,0;VertexOffset;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;0;14;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0.0;False;4;FLOAT;0.0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0.0;False;9;FLOAT;0.0;False;10;OBJECT;0.0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;49;0;18;0
WireConnection;50;0;49;0
WireConnection;47;0;18;0
WireConnection;47;1;50;0
WireConnection;36;0;40;0
WireConnection;36;1;41;0
WireConnection;37;0;38;0
WireConnection;37;1;39;0
WireConnection;34;0;37;1
WireConnection;34;1;36;1
WireConnection;34;2;47;0
WireConnection;51;0;34;0
WireConnection;51;1;10;2
WireConnection;8;1;51;0
WireConnection;0;2;8;0
ASEEND*/
//CHKSM=AAF2EA5B7DB5715D59B4CF47B66992818A4CD617