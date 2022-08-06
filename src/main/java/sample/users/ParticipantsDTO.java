/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.users;

/**
 *
 * @author Tuan Be
 */
public class ParticipantsDTO {

    private String userID;
    private String eventID;
    private boolean status;
    private String qrCode;
    private boolean participantsCheck;
    private int slotID;
    private String takePlaceDate;

    public ParticipantsDTO() {
        this.userID = "";
        this.eventID = "";
        this.status = false;
        this.qrCode = "";
        this.participantsCheck = false;
        this.slotID = 0;
        this.takePlaceDate = "";
    }

    public ParticipantsDTO(String userID, String eventID, boolean status, String qrCode, boolean participantsCheck, int slotID, String takePlaceDate) {
        this.userID = userID;
        this.eventID = eventID;
        this.status = status;
        this.qrCode = qrCode;
        this.participantsCheck = participantsCheck;
        this.slotID = slotID;
        this.takePlaceDate = takePlaceDate;
    }

    public ParticipantsDTO(String userID, String eventID, boolean status, String qrCode, boolean participantsCheck) {
        this.userID = userID;
        this.eventID = eventID;
        this.status = status;
        this.qrCode = qrCode;
        this.participantsCheck = participantsCheck;
    }

    public String getTakePlaceDate() {
        return takePlaceDate;
    }

    public void setTakePlaceDate(String takePlaceDate) {
        this.takePlaceDate = takePlaceDate;
    }

    public int getSlotID() {
        return slotID;
    }

    public void setSlotID(int slotID) {
        this.slotID = slotID;
    }

    public String getQrCode() {
        return qrCode;
    }

    public void setQrCode(String qrCode) {
        this.qrCode = qrCode;
    }

    public boolean isParticipantsCheck() {
        return participantsCheck;
    }

    public void setParticipantsCheck(boolean participantsCheck) {
        this.participantsCheck = participantsCheck;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getEventID() {
        return eventID;
    }

    public void setEventID(String eventID) {
        this.eventID = eventID;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "ParticipantsDTO{" + "userID=" + userID + ", eventID=" + eventID + ", status=" + status + ", qrCode=" + qrCode + ", participantsCheck=" + participantsCheck + ", slotID=" + slotID + ", takePlaceDate=" + takePlaceDate + '}';
    }

}
