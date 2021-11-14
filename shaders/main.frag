precision mediump float;

uniform vec4 globalColor;

// varying vec4 vColor;
varying vec3 vPosition;

void main()
{
    vec2 myUv = vPosition.xy * .5 + .5;

    gl_FragColor = globalColor * vec4(myUv, 0., 1.);
}
