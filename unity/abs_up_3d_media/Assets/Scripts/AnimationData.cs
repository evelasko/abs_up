using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "AnimationData", menuName = "Abs Up/Animation Data")]
public class AnimationData : ScriptableObject
{
    [SerializeField] public List<AnimationClip> animations;
}