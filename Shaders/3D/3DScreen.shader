// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "3D/3DScreen"
{
	Properties
	{
		[HideInInspector] __dirty( "", Int ) = 1
		_ScreenTexture("Screen Texture", 2D) = "white" {}
		[Toggle]_OverUnder("Over-Under", Float) = 0
		[Toggle]_SwapEyes("Swap Eyes", Float) = 0
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
			float2 texcoord_3;
			float2 texcoord_4;
			float2 texcoord_5;
		};

		uniform sampler2D _ScreenTexture;
		uniform fixed _OverUnder;
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
			o.texcoord_3.xy = v.texcoord.xy * float2( 1,1 ) + float2( 0,0 );
			float2 temp_cast_4 = (0.5).xx;
			float2 temp_cast_5 = (0.5).xx;
			o.texcoord_4.xy = v.texcoord.xy * temp_cast_4 + temp_cast_5;
			float2 temp_cast_6 = (0.5).xx;
			float2 temp_cast_7 = (0.0).xx;
			o.texcoord_5.xy = v.texcoord.xy * temp_cast_6 + temp_cast_7;
		}

		inline fixed4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return fixed4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float AdjustedEyeIndex65 = lerp(unity_StereoEyeIndex,( -unity_StereoEyeIndex + 1.0 ),_SwapEyes);
			float lerpResult64 = lerp( i.texcoord_0.x , i.texcoord_1.x , AdjustedEyeIndex65);
			float2 appendResult71 = (float2(lerpResult64 , i.texcoord_2.y));
			float lerpResult34 = lerp( i.texcoord_4.y , i.texcoord_5.y , AdjustedEyeIndex65);
			float2 appendResult53 = (float2(i.texcoord_3.x , lerpResult34));
			o.Emission = tex2D( _ScreenTexture, lerp(appendResult71,appendResult53,_OverUnder) ).xyz;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=12001
1767;159;1452;749;65.30554;131.6998;1;True;True
Node;StereoEyeIndex;49;-827.1262,-340.9242;Float;False;0;1;FLOAT
Node;AmplifyShaderEditor.NegateNode;50;-610.8336,-234.2236;Float;False;1;0;FLOAT;0.0;False;1;FLOAT
Node;AmplifyShaderEditor.SimpleAddOpNode;51;-432.8338,-234.2236;Float;False;2;2;0;FLOAT;0.0;False;1;FLOAT;1.0;False;1;FLOAT
Node;AmplifyShaderEditor.RangedFloatNode;59;-822.9582,1004.028;Float;False;Constant;_Float6;Float 6;1;0;0.5;0;0;0;1;FLOAT
Node;AmplifyShaderEditor.RangedFloatNode;57;-818.5599,752.128;Float;False;Constant;_Float4;Float 4;1;0;0.5;0;0;0;1;FLOAT
Node;AmplifyShaderEditor.RangedFloatNode;58;-820.7576,839.0283;Float;False;Constant;_Float5;Float 5;1;0;0;0;0;0;1;FLOAT
Node;AmplifyShaderEditor.ToggleSwitchNode;52;-244.8348,-344.2237;Fixed;False;Property;_SwapEyes;Swap Eyes;2;1;[Toggle];0;2;0;FLOAT;0.0;False;1;FLOAT;0.0;False;1;FLOAT
Node;AmplifyShaderEditor.RangedFloatNode;60;-821.8572,923.7277;Float;False;Constant;_Float7;Float 7;1;0;0.5;0;0;0;1;FLOAT
Node;AmplifyShaderEditor.RangedFloatNode;39;-826.3977,250.4;Float;False;Constant;_Float1;Float 1;1;0;0.5;0;0;0;1;FLOAT
Node;AmplifyShaderEditor.RangedFloatNode;40;-827.4974,335.0994;Float;False;Constant;_Float2;Float 2;1;0;0.5;0;0;0;1;FLOAT
Node;AmplifyShaderEditor.RangedFloatNode;41;-828.5983,415.4;Float;False;Constant;_Float3;Float 3;1;0;0;0;0;0;1;FLOAT
Node;AmplifyShaderEditor.RangedFloatNode;38;-824.2,163.4997;Float;False;Constant;_Float0;Float 0;1;0;0.5;0;0;0;1;FLOAT
Node;AmplifyShaderEditor.TextureCoordinatesNode;63;-423.4674,779.2279;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.TextureCoordinatesNode;37;-429.1076,190.5996;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.TextureCoordinatesNode;36;-427.407,343.5999;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.TextureCoordinatesNode;62;-421.7668,932.2282;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.RegisterLocalVarNode;65;-16.10825,-321.1987;Float;False;AdjustedEyeIndex;-1;True;1;0;FLOAT;0.0;False;1;FLOAT
Node;AmplifyShaderEditor.GetLocalVarNode;66;-425.4096,1078;Float;False;65;0;1;FLOAT
Node;AmplifyShaderEditor.GetLocalVarNode;67;-425.4097,489.2022;Float;False;65;0;1;FLOAT
Node;AmplifyShaderEditor.TextureCoordinatesNode;70;-83.80167,1121.1;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.TextureCoordinatesNode;10;-84.89588,195.9006;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.LerpOp;64;2.533312,962.8275;Float;False;3;0;FLOAT;0.0;False;1;FLOAT;0.0;False;2;FLOAT;0.0;False;1;FLOAT
Node;AmplifyShaderEditor.LerpOp;34;-4.10711,374.1992;Float;False;3;0;FLOAT;0.0;False;1;FLOAT;0.0;False;2;FLOAT;0.0;False;1;FLOAT
Node;AmplifyShaderEditor.DynamicAppendNode;71;238.2872,877.3025;Float;False;FLOAT2;4;0;FLOAT;0.0;False;1;FLOAT;0.0;False;2;FLOAT;0.0;False;3;FLOAT;0.0;False;1;FLOAT2
Node;AmplifyShaderEditor.DynamicAppendNode;53;227.8928,283.2014;Float;False;FLOAT2;4;0;FLOAT;0.0;False;1;FLOAT;0.0;False;2;FLOAT;0.0;False;3;FLOAT;0.0;False;1;FLOAT2
Node;AmplifyShaderEditor.ToggleSwitchNode;68;531.7948,-15.79852;Fixed;False;Property;_OverUnder;Over-Under;1;1;[Toggle];0;2;0;FLOAT2;0,0;False;1;FLOAT2;0.0;False;1;FLOAT2
Node;AmplifyShaderEditor.StaticSwitch;72;520.0945,376.7002;Float;False;Property;_Keyword0;Keyword 0;3;0;1;False;2;0;FLOAT;0.0;False;1;FLOAT;0.0;False;1;FLOAT
Node;AmplifyShaderEditor.SamplerNode;8;757.0021,-29.09985;Float;True;Property;_ScreenTexture;Screen Texture;0;0;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;0.0;False;5;FLOAT4;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;1147.804,-26.60001;Float;False;True;3;Float;ASEMaterialInspector;0;Unlit;3D/3DScreen;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;0;False;0;0;Opaque;0.5;True;True;0;False;Opaque;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;False;0;255;255;0;0;0;0;False;0;4;10;25;False;0.5;True;0;Zero;Zero;0;Zero;Zero;Add;Add;0;False;0;0,0,0,0;VertexOffset;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;0;14;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0.0;False;4;FLOAT;0.0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0.0;False;9;FLOAT;0.0;False;10;OBJECT;0.0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;50;0;49;0
WireConnection;51;0;50;0
WireConnection;52;0;49;0
WireConnection;52;1;51;0
WireConnection;63;0;57;0
WireConnection;63;1;58;0
WireConnection;37;0;38;0
WireConnection;37;1;39;0
WireConnection;36;0;40;0
WireConnection;36;1;41;0
WireConnection;62;0;60;0
WireConnection;62;1;59;0
WireConnection;65;0;52;0
WireConnection;64;0;63;1
WireConnection;64;1;62;1
WireConnection;64;2;66;0
WireConnection;34;0;37;2
WireConnection;34;1;36;2
WireConnection;34;2;67;0
WireConnection;71;0;64;0
WireConnection;71;1;70;2
WireConnection;53;0;10;1
WireConnection;53;1;34;0
WireConnection;68;0;71;0
WireConnection;68;1;53;0
WireConnection;8;1;68;0
WireConnection;0;2;8;0
ASEEND*/
//CHKSM=42676FA0B30BB20189DE27611E94E8A227FEFE41