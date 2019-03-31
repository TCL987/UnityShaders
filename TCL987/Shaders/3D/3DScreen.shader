// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "TCL987/3D/Toggleable OU SBS"
{
	Properties
	{
		_ScreenTexture("Screen Texture", 2D) = "white" {}
		[Toggle(_)]_OverUnder("Over-Under", Int) = 0
		[Toggle(_)]_SwapEyes("Swap-Eyes", Int) = 0
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Unlit keepalpha addshadow fullforwardshadows vertex:vertexDataFunc 
		struct Input
		{
			float2 vertexToFrag80;
		};

		uniform sampler2D _ScreenTexture;
		uniform int _SwapEyes;
		uniform int _OverUnder;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float2 temp_cast_0 = (0.5).xx;
			float2 temp_cast_1 = (0.0).xx;
			float2 uv_TexCoord63 = v.texcoord.xy * temp_cast_0 + temp_cast_1;
			float2 temp_cast_2 = (0.5).xx;
			float2 temp_cast_3 = (0.5).xx;
			float2 uv_TexCoord62 = v.texcoord.xy * temp_cast_2 + temp_cast_3;
			float localStereoEyeIndex73 = ( unity_StereoEyeIndex );
			float lerpResult83 = lerp( localStereoEyeIndex73 , ( -localStereoEyeIndex73 + 1.0 ) , (float)_SwapEyes);
			float AdjustedEyeIndex65 = lerpResult83;
			float lerpResult64 = lerp( uv_TexCoord63.x , uv_TexCoord62.x , AdjustedEyeIndex65);
			float2 appendResult71 = (float2(lerpResult64 , v.texcoord.xy.y));
			float2 temp_cast_5 = (0.5).xx;
			float2 temp_cast_6 = (0.5).xx;
			float2 uv_TexCoord37 = v.texcoord.xy * temp_cast_5 + temp_cast_6;
			float2 temp_cast_7 = (0.5).xx;
			float2 temp_cast_8 = (0.0).xx;
			float2 uv_TexCoord36 = v.texcoord.xy * temp_cast_7 + temp_cast_8;
			float lerpResult34 = lerp( uv_TexCoord37.y , uv_TexCoord36.y , AdjustedEyeIndex65);
			float2 appendResult53 = (float2(v.texcoord.xy.x , lerpResult34));
			float2 lerpResult81 = lerp( appendResult71 , appendResult53 , (float)_OverUnder);
			o.vertexToFrag80 = lerpResult81;
		}

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			o.Emission = tex2D( _ScreenTexture, i.vertexToFrag80 ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16301
3919;770;1493;698;1844.234;540.6569;2.718328;True;True
Node;AmplifyShaderEditor.CustomExpressionNode;73;-820.9353,-325.7404;Float;False;unity_StereoEyeIndex;1;False;0;StereoEyeIndex;True;False;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;50;-610.8336,-234.2236;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;76;-431.4674,-136.323;Float;False;Property;_SwapEyes;Swap-Eyes;2;0;Create;True;0;0;False;1;Toggle(_);0;0;0;1;INT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;51;-432.8338,-234.2236;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;83;-154.9237,-324.4702;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;58;-820.7576,839.0283;Float;False;Constant;_Float5;Float 5;1;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;65;38.89175,-305.1987;Float;False;AdjustedEyeIndex;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;60;-821.8572,923.7277;Float;False;Constant;_Float7;Float 7;1;0;Create;True;0;0;False;0;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;57;-818.5599,752.128;Float;False;Constant;_Float4;Float 4;1;0;Create;True;0;0;False;0;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;59;-822.9582,1004.028;Float;False;Constant;_Float6;Float 6;1;0;Create;True;0;0;False;0;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;66;-425.4096,1078;Float;False;65;AdjustedEyeIndex;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;38;-824.2,163.4997;Float;False;Constant;_Float0;Float 0;1;0;Create;True;0;0;False;0;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;41;-828.5983,415.4;Float;False;Constant;_Float3;Float 3;1;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;39;-826.3977,250.4;Float;False;Constant;_Float1;Float 1;1;0;Create;True;0;0;False;0;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;62;-421.7668,932.2282;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;63;-423.4674,779.2279;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;40;-827.4974,335.0994;Float;False;Constant;_Float2;Float 2;1;0;Create;True;0;0;False;0;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;70;-83.80167,1121.1;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;36;-427.407,343.5999;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;37;-429.1076,190.5996;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;67;-425.4097,489.2022;Float;False;65;AdjustedEyeIndex;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;64;2.533312,962.8275;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;10;-83.89588,192.9006;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;71;238.2872,877.3025;Float;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;34;-5.10711,383.1992;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;74;218.0183,386.262;Float;False;Property;_OverUnder;Over-Under;2;0;Create;True;0;0;False;1;Toggle(_);0;0;0;1;INT;0
Node;AmplifyShaderEditor.DynamicAppendNode;53;227.8928,283.2014;Float;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.WireNode;82;431.4722,173.9356;Float;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;81;567.4722,103.9356;Float;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.VertexToFragmentNode;80;786.773,50.826;Float;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;8;1068.214,-30.37531;Float;True;Property;_ScreenTexture;Screen Texture;0;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;1404.172,-41.90552;Float;False;True;2;Float;ASEMaterialInspector;0;0;Unlit;TCL987/3D/Toggleable OU SBS;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;0;4;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;1;False;-1;1;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;50;0;73;0
WireConnection;51;0;50;0
WireConnection;83;0;73;0
WireConnection;83;1;51;0
WireConnection;83;2;76;0
WireConnection;65;0;83;0
WireConnection;62;0;60;0
WireConnection;62;1;59;0
WireConnection;63;0;57;0
WireConnection;63;1;58;0
WireConnection;36;0;40;0
WireConnection;36;1;41;0
WireConnection;37;0;38;0
WireConnection;37;1;39;0
WireConnection;64;0;63;1
WireConnection;64;1;62;1
WireConnection;64;2;66;0
WireConnection;71;0;64;0
WireConnection;71;1;70;2
WireConnection;34;0;37;2
WireConnection;34;1;36;2
WireConnection;34;2;67;0
WireConnection;53;0;10;1
WireConnection;53;1;34;0
WireConnection;82;0;71;0
WireConnection;81;0;82;0
WireConnection;81;1;53;0
WireConnection;81;2;74;0
WireConnection;80;0;81;0
WireConnection;8;1;80;0
WireConnection;0;2;8;0
ASEEND*/
//CHKSM=AB61F9F5F787962E5CEAA0745571EC76663F2EEF