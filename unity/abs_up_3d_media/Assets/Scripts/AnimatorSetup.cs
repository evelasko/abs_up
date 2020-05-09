using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AnimatorSetup : MonoBehaviour
{
    public AnimatorOverrideController animatorOverrideController;
    [SerializeField] public AnimationData animationData;
    public string exerciseName = "flutter_kicks";

    // Start is called before the first frame update
    void Start()
    {
        if (animatorOverrideController != null)
        {
            foreach (AnimationClip clip in animationData.animations)
            {
                Debug.Log(clip.name);
                if (clip.name == exerciseName)
                {
                    Debug.Log("found the animation clip!");
                    animatorOverrideController["exercise"] = clip;
                }
            }
        }
    }
}
