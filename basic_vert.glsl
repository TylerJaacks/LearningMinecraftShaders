#version 460

// attributes
in vec3 vaPosition;
in vec2 vaUV0;
in vec3 vaColor;
in ivec2 vaUV2;

// uniforms
uniform vec3 chunkOffset;
uniform mat4 modelViewMatrix;
uniform mat4 projectionMatrix;
uniform vec3 cameraPosition;
uniform mat4 gbufferModelViewInverse;

out vec2 texCoord;
out vec3 folliageColor;
out vec2 lightMapCoords;

void main() {
    texCoord = vaUV0;
    folliageColor = vaColor.rgb;
    lightMapCoords = vaUV2 * (1.0 / 256.0) + (1.0  / 32.0);

    gl_Position = projectionMatrix * modelViewMatrix * vec4(vaPosition + chunkOffset, 1);
}