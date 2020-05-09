using UnityEngine;

public class CameraOrbitScript : MonoBehaviour
{
    protected Transform _XForm_Camera;
    protected Transform _XForm_Parent;
    protected Vector3 _LocalRotation;
    protected float _CameraDistance = 1.5f;

    public float MouseSensistivity = 4f;
    public float ScrollSensitivity = 2f;
    public float OrbitDampening = 10f;
    public float ScrollDampening = 6f;
    public bool CameraDisabled = false;
    public float ClampZoomIn = 1f;
    public float ClampZoomOut = 3f;

    // Start is called before the first frame update
    void Start()
    {
        this._XForm_Camera = this.transform;
        this._XForm_Parent = this.transform.parent;
        _LocalRotation = this._XForm_Parent.localRotation.eulerAngles;

    }

    // Late Update is called once per frame after Update() on every game object in the scene.
    void LateUpdate()
    {

        if (Input.GetKeyDown(KeyCode.LeftShift))
            CameraDisabled = !CameraDisabled;

        // if (!CameraDisabled)
        if (Input.GetMouseButton(0))
        {
            if (Input.GetAxis("Mouse X") != 0 || Input.GetAxis("Mouse Y") != 0)
            {
                _LocalRotation.x += Input.GetAxis("Mouse X") * MouseSensistivity;
                _LocalRotation.y -= Input.GetAxis("Mouse Y") * MouseSensistivity;

                // Clamp the y rotation to horizon and not flipping over at the top
                _LocalRotation.y = Mathf.Clamp(_LocalRotation.y, 0f, 90f);

                // Zooming input from Mouse Scroll Wheel
                if (Input.GetAxis("Mouse ScrollWheel") != 0f)
                {
                    float ScrollAmount = Input.GetAxis("Mouse ScrollWheel") * ScrollSensitivity;
                    // Makes camera zoom faster the further away it is from the target
                    ScrollAmount *= (this._CameraDistance * 0.3f);

                    this._CameraDistance += ScrollAmount * -1f;
                    // Clamp camera distance between 1.5 and 100 meters away from target
                    this._CameraDistance = Mathf.Clamp(this._CameraDistance, this.ClampZoomIn, this.ClampZoomOut);
                }

            }
        }
        // Camera rig transformations (withe easing in and out)
        Quaternion QT = Quaternion.Euler(_LocalRotation.y, _LocalRotation.x, 0);
        this._XForm_Parent.rotation = Quaternion.Lerp(this._XForm_Parent.rotation, QT, Time.deltaTime * OrbitDampening);
        if (this._XForm_Camera.localPosition.z != this._CameraDistance * -1f)
        {
            this._XForm_Camera.localPosition = new Vector3(
                0f,
                0f,
                Mathf.Lerp(
                    this._XForm_Camera.localPosition.z,
                    this._CameraDistance * -1f,
                    Time.deltaTime * ScrollDampening
                )
            );
        }
    }
}
